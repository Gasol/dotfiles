#!/usr/bin/env sh

PYTHONPATH=
TMUX=$(which tmux)
SITE_DIR=$(python -m site --user-site)
$TMUX source $SITE_DIR/powerline/bindings/tmux/powerline.conf
$TMUX set -g status-left-length 90
