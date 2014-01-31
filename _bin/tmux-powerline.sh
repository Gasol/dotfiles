#!/usr/bin/env sh

TMUX=$(which tmux)
SITE_DIR=$(python -m site --user-site)
$TMUX source $SITE_DIR/powerline/bindings/tmux/powerline.conf
