#!/usr/bin/zsh

# Directional select-pane for tmux that preserves zoom status.

tmux list-panes -F '#F' | grep -q Z && zoomed_in=true || zoomed_in=false
direction=$1
allowed=("-U" "-D" "-L" "-R")

if [[ -z $direction ]]; then
    echo "Direction required."
    exit 1
fi

if [[ ${allowed[(r)$direction]} != $direction ]]; then
    echo "Direction not allowed."
    exit 1
fi

tmux select-pane $direction

if $zoomed_in; then
    tmux resize-pane -Z
fi
