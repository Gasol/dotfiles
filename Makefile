# Plain syntax only: this file must run under GNU make and BSD make.
# Logic lives in bootstrap-stow.sh and test.sh.

TARGET ?= $(HOME)
PACKAGES = bash config git irssi misc tmux vcs

.PHONY: install uninstall check test macos

# .config must exist before stow runs, or stow folds it into one symlink
# and every app then writes its data into this repository.
install:
	@mkdir -p $(TARGET)/.config
	@STOW=$$(sh ./bootstrap-stow.sh) && $$STOW -t $(TARGET) $(PACKAGES)
	@if [ "$(TARGET)" = "$$HOME" ]; then $(MAKE) macos; fi

uninstall:
	@STOW=$$(sh ./bootstrap-stow.sh) && $$STOW -D -t $(TARGET) $(PACKAGES)

check:
	@STOW=$$(sh ./bootstrap-stow.sh) && $$STOW -n -v -t $(TARGET) $(PACKAGES)

test:
	@sh ./test.sh

macos:
	@if [ "$$(uname -s)" = Darwin ]; then sh ./macos.sh; else echo "macos: skipped, not Darwin"; fi
