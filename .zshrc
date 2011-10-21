# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
unsetopt nomatch
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#	zstyle :compinstall filename '/home/revence/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PAGER=less
export EDITOR=vim
export CVSEDITOR=$EDITOR

export DISPLAY=:0

#export LC_TYPE=en_GB.UTF-8
export LC_TYPE=fr_FR.UTF-8
#export LC_CTYPE=en_GB.UTF-8
export LC_CTYPE=fr_FR.UTF-8

alias ls='ls --color'
alias ping='ping -a'
alias ssu='sudo su'

bindkey -v

PROMPT="%B%n@%m:%2c%b%# "
RPROMPT=" %(?.%U%T%u.$(print '%{\e[1;31m%}%?%{\e[0m%}'))"

#	Util functions ...


#	Equivalent to mkdir x && cd x
mkcd()
{
	mkdir -p "$1" && cd "$1"
}
