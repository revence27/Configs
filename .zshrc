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


# Path to your oh-my-zsh installation.
  export ZSH=/home/revence/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails ruby)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PAGER=less
export EDITOR=vim
export CVSEDITOR=$EDITOR
export BROWSER='w3m -T text/html'
export GOROOT="/home/revence/Documents/Hacks/sundry/go_appengine"

export DISPLAY=:0

export LC_ALL=en_GB.UTF-8
export LANGUAGE=en_GB
export LANG=en_GB
export LC_TYPE=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8

alias ls='ls --color'
alias ping='ping -a'
alias ssu='sudo su'
alias sml='rlwrap sml'
alias ocaml='rlwrap ocaml'
alias youtube-dl='youtube-dl --no-part -o "%(title)s-%(format)s-%(id)s.%(ext)s" --no-playlist -f18'
alias yautube-dl='youtube-dl --no-part -A -xk --audio-format mp3 --audio-quality 0 -f18'
alias wget='wget -Sc'
alias ssu='sudo su ; exit'
alias pivotapp="ssh -t pivotweb 'ssh apps -t tmux attach'"
alias mpg123='mpg123 -C'
alias guile='rlwrap guile'
alias racket='rlwrap racket'
alias bobot='bobot++ -d ~/.bobot/'

bindkey -v

# PROMPT="%B%n@%m:%2c%b%# "
# RPROMPT=" %(?.%U%T%u.$(print '%{\e[1;31m%}%?%{\e[0m%}'))"

#	Util functions ...
source ~/.bin/tmuxinator.zsh

#	Equivalent to mkdir x && cd x
mkcd()
{
	mkdir -p "$1" && cd "$1"
}

export set PATH="$GOROOT:$PATH"
