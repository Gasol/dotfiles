# Dotfiles

My dotfiles, installed with GNU Make and GNU Stow. They run on macOS, Linux and FreeBSD.

## First

Don't take things without thinking.

## Layout

Each top-level directory is a Stow package. A `dot-` prefix becomes a `.` in
your home directory: `bash/dot-bashrc` is linked as `~/.bashrc`.

`~/.config` and `~/bin` stay real directories. Only the files tracked here are
linked into them, so app data never lands in this repository. To track a new
app, add `config/dot-config/<app>/` and run `make install`.

## Requirements

- `make` (GNU make or BSD make), `git`, a full `perl`, and `curl` or `wget`.
- GNU Stow 2.4.1 or newer. If your system has none, or an older one, `make`
  builds 2.4.1 into `~/.local/opt` after checking its SHA-256.

| System | Command |
|---|---|
| macOS | `brew install stow` (optional) |
| Debian 13 | `apt install make git perl curl stow` |
| Debian 12, Ubuntu 22.04 and 24.04 | `apt install make git perl curl` (their stow is 2.3.1, so the build runs) |
| FreeBSD | `pkg install git perl5 curl stow` |

## Install

    git clone git@github.com:Gasol/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    make install

- `make check` shows what `install` would do and fails on a conflict.
- `make uninstall` removes every link.
- `make test` installs into a temporary directory and checks the layout.
- On macOS, `make install` also applies the settings in `macos.sh`.

## Machine-specific settings

Settings that exist on one machine only go in files that this repository does
not track. Git reads `~/.gitconfig.local` if it exists. On macOS:

    [core]
        pager = delta
    [interactive]
        diffFilter = delta --color-only

## tmux

`make install` clones the plugin manager (tpm) into
`~/.local/share/tmux/plugins`. Start tmux and press `prefix` + `I` to install
the plugins listed in `~/.tmux.conf`.
