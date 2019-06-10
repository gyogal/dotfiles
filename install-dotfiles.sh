#!/usr/bin/env bash

SRCDIR=$(dirname "$0")
cp "$SRCDIR"/tmux.conf ~/.tmux.conf
cp "$SRCDIR"/zshrc ~/.zshrc

mkdir -p ~/.config/mpv
cp "$SRCDIR"/mpv_input.conf ~/.config/mpv
