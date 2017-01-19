#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...


setopt appendhistory
setopt histignorealldups
setopt hash_list_all
setopt transient_rprompt
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
#alias cp='gcp'
alias grep='grep --color=always'
alias autoclean="rm -rfv aclocal.m4 autom4te.cache config.* configure depcomp ltmain.sh Makefile.in"
alias fuck='sudo $(fc -nl -1)'
alias start='sudo systemctl start'
alias restart='sudo systemctl restart'
alias reload='sudo systemctl reload'
alias status='sudo systemctl status'
alias stop='sudo systemctl stop'

# Personnal
alias chrome='google-chrome'
alias sd='mount /dev/mmcblk0'

#arch
alias u="sudo pacman -Syu"
alias i="sudo pacman -S"
alias s="pacman -Ss"
alias d="sudo pacman -Rcs"
alias irc="mosh dreewoo@i0x.me --ssh='ssh -p 54322' -- screen -dr irc"
alias vim=nvim
alias dr="docker run"

alias lbc='docker run -ti --rm -v /var/run/docker.sock:/var/run/docker.sock -v $(git rev-parse --show-toplevel):$(git rev-parse --show-toplevel):ro -w $(git rev-parse --show-toplevel) -e TOPDIR=$(git rev-parse --show-toplevel) docker.repo.bon-coin.net/tools/lbc'

function strip_diff_leading_symbols(){
   color_code_regex="(\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K])"

   # simplify the unified patch diff header
   sed -r "s/^($color_code_regex)diff --git .*$//g" | \
       sed -r "s/^($color_code_regex)index .*$/\n\1$(rule)/g" | \
       sed -r "s/^($color_code_regex)\+\+\+(.*)$/\1+++\5\n\1$(rule)\x1B\[m/g" |\

   # actually strips the leading symbols
       sed -r "s/^($color_code_regex)[\+\-]/\1 /g"
}

## Print a horizontal rule
rule () {
   printf "%$(tput cols)s\n"|tr " " "─"
}

echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null 2>&1

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /home/jocelyn/.travis/travis.sh ] && source /home/jocelyn/.travis/travis.sh
