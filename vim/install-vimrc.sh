#!/usr/bin/env bash

SRCDIR=$(dirname "$0")
mkdir -p ~/.vim/swapfiles
mkdir -p ~/.config/nvim
cp "$SRCDIR/vimrc" ~/.vim/
cp "$SRCDIR/ideavimrc" ~/.ideavimrc
ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
