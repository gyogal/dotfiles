function cd() { if [ $# -eq 2 ]; then builtin cd ${PWD/$1/$2}; else builtin cd "$@"; fi }

#alias tmux="TERM=linux tmux -2"

# Green if no error, red if return value is nonzero
export PS1='$(if [ $? -eq 0 ]; then echo "\[\033[01;32m\]"; else echo "\[\033[01;31m\]"; fi)'
export PS1+='\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]'
if [[ -f /etc/bash_completion.d/git-prompt ]]; then
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export PS1+='$(__git_ps1 " (%s) ")'
fi
# Add number of background jobs if nonzero
export PS1+='$(if test "\j" -ne 0; then echo " (\j)"; fi)'
export PS1+='\$ '

export CDPATH=/media/gyogal

alias yt='youtube-dl -n --all-subs --convert-subs srt --embed-subs --add-metadata --hls-use-mpegts --skip-unavailable-fragments'
alias update="sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y"

# Enable colors in less/man
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

