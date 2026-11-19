# Plain syntax only: this file must run under GNU make and BSD make.
# Logic lives in bootstrap-stow.sh and test.sh.

TARGET ?= $(HOME)
PACKAGES = bash config git irssi misc scripts tmux vcs

.PHONY: install uninstall check test lint fmt macos

# .config and bin must exist before stow runs, or stow folds each into one
# symlink and every app or tool then writes its data into this repository.
install:
	@mkdir -p $(TARGET)/.config $(TARGET)/bin
	@STOW=$$(sh ./bootstrap-stow.sh) && $$STOW -t $(TARGET) $(PACKAGES)
	@TARGET=$(TARGET) sh ./install-tpm.sh
	@if [ "$(TARGET)" = "$$HOME" ]; then $(MAKE) macos; fi

uninstall:
	@STOW=$$(sh ./bootstrap-stow.sh) && $$STOW -D -t $(TARGET) $(PACKAGES)

check:
	@STOW=$$(sh ./bootstrap-stow.sh) && $$STOW -n -v -t $(TARGET) $(PACKAGES)

test:
	@sh ./test.sh

lint:
	@sh ./format.sh check

fmt:
	@sh ./format.sh write

macos:
	@if [ "$$(uname -s)" = Darwin ]; then sh ./macos.sh; else echo "macos: skipped, not Darwin"; fi
