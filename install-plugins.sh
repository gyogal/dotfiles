#!/usr/bin/env bash

SRCDIR=$(dirname "$0")
PLUGINS=$(cat "$SRCDIR/plugin-urls.txt")
PLUGINSDIR="$HOME/.vim/pack/plugins/start"
mkdir -p "$PLUGINSDIR"
cd "$PLUGINSDIR"
for a in $PLUGINS; do echo "$a"; git clone "$a"; echo; done
cd - > /dev/null

# Additional setup for vimwiki
mkdir -p ~/vimwiki
cp "$SRCDIR"/wiki2html* ~/vimwiki

vim -c "helptags ALL"
