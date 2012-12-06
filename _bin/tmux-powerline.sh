#!/usr/bin/env sh

TMUX=$(which tmux)
TMUX_CONFIG=$($TMUX info | grep configuration | grep -oE '/.*$')
if [ -L $TMUX_CONFIG ]; then
	TMUX_CONFIG=$(readlink $TMUX_CONFIG)
fi

if [ "Darwin" = `uname`]; then
	TMUX_CONFIG_DIR=$HOME/$(dirname $TMUX_CONFIG)
else
	TMUX_CONFIG_DIR=$(dirname $TMUX_CONFIG)
fi

$TMUX set-option -g status-left "#($TMUX_CONFIG_DIR/tmux/status-left.sh)"
$TMUX set-option -g status-right "#($TMUX_CONFIG_DIR/tmux/status-right.sh)"
