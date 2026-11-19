#!/bin/sh
# Install into a temporary target and check the layout. Never touches the real $HOME.
set -eu

cd "$(dirname "$0")"
repo=$(pwd -P)
TARGET=$(mktemp -d)
export TARGET
trap 'rm -rf "$TARGET"' EXIT INT TERM

fail() {
	echo "FAIL: $*" >&2
	exit 1
}
pass() { echo "ok: $*"; }

links() {
	(cd "$TARGET" && find . -type l | sort | while read -r l; do echo "$l -> $(readlink "$l")"; done)
}

mkdir -p "$TARGET/bin"
echo '#!/bin/sh' >"$TARGET/bin/untracked-tool"

make install || fail "make install"

for d in .config bin; do
	[ -d "$TARGET/$d" ] && [ ! -L "$TARGET/$d" ] || fail "$d must be a real directory (stow folded it)"
done
pass ".config and bin are real directories"

[ -L "$TARGET/bin/gcauto" ] || fail "bin/gcauto is not a symlink"
[ -f "$TARGET/bin/untracked-tool" ] && [ ! -L "$TARGET/bin/untracked-tool" ] || fail "an existing file in bin was replaced"
[ ! -e "$repo/scripts/bin/untracked-tool" ] || fail "an untracked tool reached the repo"
pass "scripts link into an existing bin and leave other files alone"

[ -L "$TARGET/.config/nvim" ] || fail ".config/nvim is not a symlink"
[ "$(cd "$TARGET/.config/nvim" && pwd -P)" = "$repo/config/dot-config/nvim" ] || fail ".config/nvim does not point into the repo"
pass ".config/nvim links into the repo"

for f in .bashrc .gitconfig .gitignore; do
	[ -L "$TARGET/$f" ] || fail "$f is not a symlink"
done
pass "dot- files are linked, including .gitignore (default ignore list)"

mkdir -p "$TARGET/.config/runtime-app"
echo data >"$TARGET/.config/runtime-app/state"
[ ! -e "$repo/config/dot-config/runtime-app" ] || fail "app data under .config reached the repo"
pass "app data under .config stays outside the repo"

before=$(links)
make install || fail "second make install"
[ "$before" = "$(links)" ] || fail "second make install changed the links"
pass "second install changes nothing"

make uninstall || fail "make uninstall"
[ -z "$(links)" ] || fail "uninstall left symlinks: $(links)"
pass "uninstall removes every link"
