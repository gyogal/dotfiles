#!/usr/bin/env bash

SRCDIR=$(dirname "$0")
cp "$SRCDIR"/tmux.conf ~/.tmux.conf
cp "$SRCDIR"/zshrc ~/.zshrc
cp "$SRCDIR"/gitignore_global ~/.gitignore_global

# OSX
cp "$SRCDIR"/vscode/settings.json ~/Library/Application\ Support/Code/User/ 2> /dev/null
# Linux
cp "$SRCDIR"/vscode/settings.json ~/.config/Code/User/ 2> /dev/null

mkdir -p ~/.config/mpv
cp "$SRCDIR"/mpv.conf ~/.config/mpv/
cp "$SRCDIR"/mpv_input.conf ~/.config/mpv/input.conf
