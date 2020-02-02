#!/usr/bin/env bash

git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt true
git config --global mergetool.keepBackup false

git config --global diff.tool vimdiff
git config --global difftool.prompt true

git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.pager true
git config --global color.status auto

git config --global alias.l "log --pretty=format:\"%C(yellow)%h%Creset%C(red)%C(bold)%d %C(green)%ai %C(cyan)%an%C(green), %ci %C(cyan)%cn%Creset %s\""
git config --global alias.d difftool

git config --global core.pager 'less -FRX'
git config --global core.excludesfile '~/.gitignore_global'

