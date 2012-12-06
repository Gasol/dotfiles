#!/usr/bin/env sh

TMUX=$(which tmux)
TMUX_CONFIG=$($TMUX info | grep configuration | grep -oE '/.*$')
if [ -L $TMUX_CONFIG ]; then
	TMUX_CONFIG_DIR=$(dirname $(readlink -f $TMUX_CONFIG))
	$TMUX set-option -g status-left "#($TMUX_CONFIG_DIR/tmux/status-left.sh)"
	$TMUX set-option -g status-right "#($TMUX_CONFIG_DIR/tmux/status-right.sh)"
fi
