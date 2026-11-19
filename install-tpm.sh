#!/bin/sh
# Clone the tmux plugin manager (tpm) outside the repo, at a pinned commit.
# TPM installs every other plugin next to it, so none of them reach this repository.
set -eu

PIN=26d9ace1b47f4591b2afdf333442a498311b6ace
TARGET=${TARGET:-$HOME}
DIR=$TARGET/.local/share/tmux/plugins/tpm

[ -d "$DIR/.git" ] && exit 0

if ! command -v git >/dev/null 2>&1; then
	echo "install-tpm: git is required to install tpm" >&2
	exit 1
fi

mkdir -p "$(dirname "$DIR")"
# A public clone needs no credentials; skipping the helper avoids keychain prompts.
git -c credential.helper= clone -q https://github.com/tmux-plugins/tpm "$DIR"
git -C "$DIR" -c advice.detachedHead=false checkout -q "$PIN"
