#!/usr/bin/env sh

TMUX=$(which tmux)
TMUX_CONFIG=$($TMUX info | grep configuration | grep -oE '/.*$')
if [ -L $TMUX_CONFIG ]; then
	TMUX_CONFIG=$(python -c 'import os,sys; print os.path.realpath(sys.argv[1]);' $TMUX_CONFIG)
	TMUX_CONFIG_DIR=$(dirname $TMUX_CONFIG)
fi

$TMUX set-option -g status-left "#($TMUX_CONFIG_DIR/tmux/powerline.sh left)"
$TMUX set-option -g status-right "#($TMUX_CONFIG_DIR/tmux/powerline.sh right)"
