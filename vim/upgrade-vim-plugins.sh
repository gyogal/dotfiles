#!/usr/bin/env bash

PLUGINSDIR="$HOME/.vim/pack/plugins/start"
pushd . > /dev/null
cd "$PLUGINSDIR"
for a in *; do cd "$a" && echo "$a" && git pull --rebase; echo; cd - > /dev/null; done
popd > /dev/null
