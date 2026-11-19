#!/bin/sh
# Check or fix the format of the files this repository owns.
# usage: format.sh check|write
#
# Not covered on purpose: irssi/ and the legacy scripts in scripts/bin (third-party
# copies), and files that tools rewrite (nvim lazy-lock.json and lazyvim.json).
set -eu

cd "$(dirname "$0")"

mode=${1:-check}
case $mode in
check | write) ;;
*)
	echo "usage: $0 check|write" >&2
	exit 2
	;;
esac

tools="shfmt shellcheck stylua editorconfig-checker"
for t in $tools; do
	if ! command -v "$t" >/dev/null 2>&1; then
		# Tools are pinned in mise.toml; retry once through mise.
		if [ -z "${FORMAT_VIA_MISE:-}" ] && command -v mise >/dev/null 2>&1; then
			FORMAT_VIA_MISE=1 exec mise exec -- sh "$0" "$@"
		fi
		echo "format.sh: $t not found; install the tools in mise.toml with 'mise install'" >&2
		exit 1
	fi
done

owned() {
	git ls-files -- \
		bash git misc tmux/dot-tmux.conf \
		config/dot-config/nvim config/dot-config/powerline \
		config/dot-config/alacritty config/dot-config/neomutt \
		.editorconfig .gitignore .stowrc .github mise.toml Makefile README.md \
		macos.sh bootstrap-stow.sh install-tpm.sh test.sh format.sh \
		scripts/bin/agent-git-trees.sh scripts/bin/claude-notify scripts/bin/gcauto \
		scripts/bin/git-auto-commit-codex scripts/bin/rfv \
		':!config/dot-config/nvim/lazy-lock.json' ':!config/dot-config/nvim/lazyvim.json' \
		':!config/dot-config/nvim/lua/plugins/example.lua'
}

# Shell that shfmt and shellcheck understand. zsh scripts are skipped.
is_shell() {
	if head -n 1 "$1" | grep -q zsh; then
		return 1
	fi
	case $1 in
	*.sh | bash/dot-bash*) return 0 ;;
	esac
	head -n 1 "$1" | grep -Eq '^#! ?(/usr/bin/env )?(/bin/)?(ba)?sh( |$)'
}

dialect() {
	case $1 in
	bash/dot-bash*) echo bash ;;
	*) if head -n 1 "$1" | grep -q bash; then echo bash; else echo posix; fi ;;
	esac
}

files=$(owned)
shell_files=$(for f in $files; do if is_shell "$f"; then echo "$f"; fi; done)
lua_files=$(echo "$files" | grep '\.lua$' || true)
status=0

if [ "$mode" = write ]; then
	# Whitespace the formatters do not touch. Markdown keeps trailing spaces (line breaks).
	for f in $files; do
		case $f in *.md) continue ;; esac
		perl -i -pe 's/\r$//; s/[ \t]+$//' "$f"
	done
	for f in $files; do
		[ -n "$(tail -c1 "$f")" ] && echo >>"$f"
	done
	for f in $shell_files; do
		shfmt -ln "$(dialect "$f")" -w "$f"
	done
	# shellcheck disable=SC2086
	[ -n "$lua_files" ] && stylua $lua_files
	exit 0
fi

# shellcheck disable=SC2086
editorconfig-checker $files || status=1
for f in $shell_files; do
	# The old bash config and legacy scripts only have to be free of errors.
	# Scripts written for this repo must also be free of warnings.
	case $f in
	bash/* | scripts/*) severity=error ;;
	*) severity=warning ;;
	esac
	# shfmt calls the dialect "posix"; shellcheck calls it "sh".
	d=$(dialect "$f")
	if [ "$d" = posix ]; then sc="sh"; else sc=$d; fi
	shfmt -ln "$d" -d "$f" || status=1
	shellcheck --severity="$severity" -s "$sc" "$f" || status=1
done
# shellcheck disable=SC2086
[ -n "$lua_files" ] && { stylua --check $lua_files || status=1; }
exit $status
