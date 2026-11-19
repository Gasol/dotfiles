#!/bin/sh
# Print the path of a GNU Stow >= $MIN: the one on PATH, else one built from source.
# 2.4.0 fixed --dotfiles with directories; 2.4.1 fixed the ignore list for dot- names.
# Ubuntu 24.04 and Debian 12 still ship 2.3.1, hence the build.
set -eu

MIN=2.4.1
VERSION=2.4.1
SHA256=2a671e75fc207303bfe86a9a7223169c7669df0a8108ebdf1a7fe8cd2b88780b
# ftp.gnu.org answers 403 to some clients; ftpmirror.gnu.org redirects to a working mirror.
# The pinned hash makes the mirror choice safe.
URL=https://ftpmirror.gnu.org/stow/stow-$VERSION.tar.gz
PREFIX=${STOW_PREFIX:-$HOME/.local/opt/stow-$VERSION}

log() { echo "bootstrap-stow: $*" >&2; }

stow_version() {
	"$1" --version 2>/dev/null | sed -n 's/.*version \([0-9][0-9.]*\).*/\1/p'
}

version_ge() {
	awk -v have="$1" -v need="$2" 'BEGIN {
		split(have, h, "."); split(need, n, ".")
		for (i = 1; i <= 3; i++) {
			if (h[i] + 0 > n[i] + 0) exit 0
			if (h[i] + 0 < n[i] + 0) exit 1
		}
		exit 0
	}'
}

usable() {
	v=$(stow_version "$1")
	[ -n "$v" ] && version_ge "$v" "$MIN"
}

sha256_of() {
	if command -v sha256sum >/dev/null 2>&1; then
		sha256sum "$1" | awk '{print $1}'
	elif command -v shasum >/dev/null 2>&1; then
		shasum -a 256 "$1" | awk '{print $1}'
	else
		sha256 -q "$1"
	fi
}

download() {
	if command -v curl >/dev/null 2>&1; then
		curl -fsSL -o "$2" "$1"
	elif command -v wget >/dev/null 2>&1; then
		wget -q -O "$2" "$1"
	else
		log "need curl or wget to download stow $VERSION"
		return 1
	fi
}

if command -v stow >/dev/null 2>&1 && usable "$(command -v stow)"; then
	command -v stow
	exit 0
fi

if [ -x "$PREFIX/bin/stow" ] && usable "$PREFIX/bin/stow"; then
	echo "$PREFIX/bin/stow"
	exit 0
fi

log "no stow >= $MIN on PATH; building $VERSION into $PREFIX"
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT INT TERM
download "$URL" "$work/stow.tar.gz"
got=$(sha256_of "$work/stow.tar.gz")
if [ "$got" != "$SHA256" ]; then
	log "SHA-256 mismatch for $URL: got $got, want $SHA256"
	exit 1
fi
tar -xzf "$work/stow.tar.gz" -C "$work"
if ! (
	cd "$work/stow-$VERSION"
	./configure --prefix="$PREFIX" && make && make install
) >"$work/build.log" 2>&1; then
	cat "$work/build.log" >&2
	log "build failed"
	exit 1
fi
# Debian and Ubuntu minimal images have perl-base only; stow needs the standard modules.
if ! usable "$PREFIX/bin/stow"; then
	log "stow was built but does not run; install the full perl package (Debian/Ubuntu: apt install perl)"
	"$PREFIX/bin/stow" --version >&2 || true
	exit 1
fi
echo "$PREFIX/bin/stow"
