#!/usr/bin/env bash

SRCDIR=$(dirname "$0")
mkdir -p ~/.vim/swapfiles
cp "$SRCDIR/vimrc" ~/.vim/
cp "$SRCDIR/ideavimrc" ~/.ideavimrc
