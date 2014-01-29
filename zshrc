ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
plugins=()

function git_prompt_info() {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return
echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}


source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:$PATH

#
# ZSH OPTS
#
setopt appendhistory
setopt histignorealldups
setopt hash_list_all
setopt transient_rprompt

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
autoload -Uz compinit; compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LSCOLORS}"

#
# KEY BINDING
#
bindkey -e
# emacs
#bindkey "^[Oc" forward-word
#bindkey "^[Od" backward-word
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
# vim
bindkey ";5D" backward-word
bindkey ";5C" forward-word
#bindkey "\e[H" beginning-of-line
#bindkey "\e[F" end-of-line

bindkey "\e[3~" delete-char
WORDCHARS="${WORDCHARS:s#/#}"
# Better history management (acts like vim)
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "\e[A" history-beginning-search-backward-end
bindkey "\e[B" history-beginning-search-forward-end

#
# ENV
#
export EDITOR="vim"
export PAGER=less
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;37m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'
export MAKEFLAGS="-j4"

# ALIASES
#
# Standard
alias ls='ls -h --color'
alias l='ls'
alias ll='ls -l'
alias la='ls -al'
alias rm='rm -v'
alias cp='gcp'
alias grep='grep --color=always'
alias autoclean="rm -rfv aclocal.m4 autom4te.cache config.* configure depcomp ltmain.sh Makefile.in"

# Personnal
alias chrome='google-chrome'
alias sd='mount /dev/mmcblk0'

#arch
alias u="sudo pacman -Syu"
alias i="sudo pacman -S"
alias s="pacman -Ss"
alias d="sudo pacman -Rcs"
alias irc="ssh i0x.me -t 'screen -dr'"

#
# COLORS DEFINITION
#
# Normal
C_BLACK=$'%{\e[0;30m%}'
C_RED=$'%{\e[0;31m%}'
C_GREEN=$'%{\e[0;32m%}'
C_BROWN=$'%{\e[0;33m%}'
C_BLUE=$'%{\e[0;34m%}'
C_PURPLE=$'%{\e[0;35m%}'
C_CYAN=$'%{\e[0;36m%}'
C_GRAY=$'%{\e[1;30m%}'
C_YELLOW=$'%{\e[1;33m%}'
C_WHITE=$'%{\e[1;37m%}'
# Light
C_LGRAY=$'%{\e[0;37m%}'
C_BLUE=$'%{\e[1;34m%}'
C_BLUE1=$'%{\e[0;34m%}'
C_GREEN=$'%{\e[2;32m%}'
C_GREEN1=$'%{\e[0;32m%}'
C_LCYAN=$'%{\e[1;36m%}'
C_RED=$'%{\e[0;31m%}'
C_RED1=$'%{\e[1;31m%}'
C_LPURPLE=$'%{\e[1;35m%}'
# Default
C_DEF=$'%{\e[0m%}'

#
# PROMPT
#

#git_prompt_info()
#{
#    git_branch=`git branch 2>/dev/null | grep -e '^*' | sed -E 's/^\* (.+)$/(\1) /' | cut -d ' ' -f2`
#    if [[ $git_branch != '' ]];
#    then
#        echo "${C_LGRAY}[${C_RED}"$git_branch"${C_LGRAY}]${C_GREEN1}"
#    fi
#}
#
#autoload colors; colors
#precmd()
#{
#    RPROMPT="[%{$fg_bold[red]%}%n%{$fg_bold[blue]%}@%{$fg_no_bold[yellow]%}%M%{$reset_color%}]"
#    PROMPT="[%{$fg_bold[green]%}%~%{$reset_color%}]$(git_prompt_info)%(?.%{$fg_bold[blue]%}.%{$fg_bold[red]%})%% %{$reset_color%}"
#}
#
export PATH=~/pebble-dev/PebbleSDK-2.0-BETA6/bin:$PATH
