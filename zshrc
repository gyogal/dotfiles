# Exports {{{
export EDITOR="vim"
export PAGER="less"
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*'"
export FZF_DEFAULT_OPTS='--height 40%'
# }}}

# Colors {{{
export LESS="-R"
export LESS_TERMCAP_mb=$(printf "\e[1;33m")
export LESS_TERMCAP_md=$(printf "\e[1;33m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[0;30;47m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[1;32m")

autoload -U colors && colors

case $(uname) in
    Linux)
        alias ls="ls --color=auto"
    ;;
    Darwin)
        export CLICOLOR=YES
    ;;
esac

export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
# }}}

# ZSH options {{{
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt \
    append_history \
    auto_list \
    auto_menu \
    hist_ignore_all_dups \
    hist_reduce_blanks \
    inc_append_history \
    long_list_jobs \
    no_beep \
    prompt_subst \
    share_history

typeset -U path
path=(
    ~/bin 
    $path
)
# }}}

# Input {{{
bindkey -e

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Ctrl-W, Alt-Backspace, Alt-B, Alf-F should work just like in bash
backward-kill-full-word () {
    local WORDCHARS="${WORDCHARS}/"
    zle backward-kill-word
}
zle -N backward-kill-full-word
bindkey '^W' backward-kill-full-word

WORDCHARS=${WORDCHARS/\/}

# Ctrl-U should work just like in bash
bindkey '^U' backward-kill-line

# }}}

# Completion {{{
zstyle ':completion:*:*:*:*:*' menu select
autoload -Uz compinit && compinit -u

sourceifexists() { [[ -f "$1" ]] && . "$1" }

# OSX
sourceifexists ~/bin/fzf/shell/key-bindings.zsh
sourceifexists ~/bin/fzf/shell/completion.zsh
sourceifexists /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
sourceifexists /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Ubuntu
sourceifexists /usr/share/doc/fzf/examples/key-bindings.zsh
sourceifexists /usr/share/doc/fzf/examples/completion.zsh
sourceifexists /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
sourceifexists /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Manjaro
sourceifexists /usr/share/fzf/key-bindings.zsh
sourceifexists /usr/share/fzf/completion.zsh
sourceifexists /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
sourceifexists /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use up and down keys to search history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
# The following two are for iTerm2
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
# }}}

# Prompt {{{
autoload -Uz vcs_info
precmd_vcs_info() {
    vcs_info
}
virtenv_indicator() {
    if [[ -z "$VIRTUAL_ENV" ]] then
        psvar[1]=""
    else
        psvar[1]="${VIRTUAL_ENV##*/}"
    fi
}
precmd_functions+=( precmd_vcs_info; virtenv_indicator )

export VIRTUAL_ENV_DISABLE_PROMPT=yes

PROMPT_SYMBOL="❯"
PROMPT_NEWLINE=$'\n'

PROMPT="$PROMPT_NEWLINE%{$fg[green]%}%~"
PROMPT="$PROMPT$fg[cyan]%(1V. (%1v).)"  # Virtualenv
PROMPT="$PROMPT\${vcs_info_msg_0_:+ \$vcs_info_msg_0_}"  # Git status
PROMPT="$PROMPT%(?.. $fg[red][%?])"  # Return value if nonzero
PROMPT="$PROMPT$fg[yellow]%(1j. (%j).)"  # Number of background jobs
PROMPT="$PROMPT$fg_bold[yellow]$PROMPT_NEWLINE$PROMPT_SYMBOL%{$reset_color%} "

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' stagedstr ' %F{green}●%f'
zstyle ':vcs_info:*' unstagedstr ' %F{yellow}●%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "%{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%}"
# }}}

# Aliases {{{
alias wttr='curl http://wttr.in/'
alias wttr2='curl http://v2.wttr.in/'
alias ssh='TERM=xterm-color ssh'
alias gr='cd $(git rev-parse --show-toplevel)'
# }}}

# Local settings {{{
sourceifexists ~/.zshrc.local
# }}}

# vim: foldmethod=marker foldlevel=0
