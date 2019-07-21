#!/usr/bin/env bash

git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false

git config --global color.branch always
git config --global color.diff always
git config --global color.interactive always
git config --global color.pager true
git config --global color.status always