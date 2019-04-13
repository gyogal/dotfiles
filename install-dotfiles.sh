#!/usr/bin/env bash

SRCDIR=$(dirname "$0")
cp "$SRCDIR"/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/mpv
cp "$SRCDIR"/mpv_input.conf ~/.config/mpv
