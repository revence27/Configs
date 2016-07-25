# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PROMPT="%B%n@%m:%2c%b%# "
RPROMPT=" %(?.%U%T%u.$(print '%{\e[1;31m%}%?%{\e[0m%}'))"

setopt appendhistory autocd extendedglob notify
unsetopt nomatch
autoload -Uz compinit
compinit

export ZSH=/home/revence/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails ruby)

# User configuration
export set ISSM_ROOT="$HOME/intel/issm_2016.0.019"
export set IAMCU_TOOLCHAIN_DIR="$ISSM_ROOT/tools/tools"
export set DLDIR="$HOME/Downloads"
export set YTDIR="$DLDIR/vidfiles/yt"
export set HACKS="$HOME/Documents/Hacks"
export set NETWORKCONTENT="$HACKS/content"
export set WINFILES="$NETWORKCONTENT/files"
export set WINPROJS="$NETWORKCONTENT/windows"
export set RAKBREW="$HOME/.rakudobrew"
export set P6BREWS="$RAKBREW/moar-nom"
export set P6HACKS="$HACKS/sundry/rakudo-star-2016.04"
export set P61="$P6BREWS/install/bin:$P6BREWS/install/share/perl6/site/bin"
export set P62="$P6HACKS/install/bin:$P6HACKS/install/share/perl6/site/bin"
export set LD_LIBRARY_PATH="$P6BREWS/install/lib:$P6HACKS/install/lib:/usr/local/lib:$LD_LIBRARY_PATH:/usr/lib:/usr/lib32"
export set PATH="$P61:$P62:$RAKBREW/bin:$HOME/.local/bin:$ISSM_ROOT:$ISSM_ROOT/tools/compiler/bin:$HACKS/sundry/bin:$GOROOT:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"
export PAGER=less
export EDITOR=vim
export CVSEDITOR=$EDITOR
export BROWSER='w3m -T text/html'
export DESKTOP="$HOME/Desktop"
export GOROOT="/home/revence/Documents/Hacks/sundry/go_appengine"
export DISPLAY=:0
export LC_ALL=en_GB.UTF-8
export LANGUAGE=en_GB
export LANG=en_GB
export LC_TYPE=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8
export IRCNICK="LeCamarade"
export IRCUSER="LeCamarade"
export IRCNAME="LeCamarade"
export IRCSERVER="irc.freenode.net"

alias ls='ls --color'
alias ping='ping -a'
alias sml='rlwrap sml'
alias ocaml='rlwrap ocaml'
alias yout='youloader --dest=/home/revence/Desktop/pendyt --pause=60'
alias youtube-dl='youtube-dl --write-sub --sub-lang en,fr --no-part -o "%(title)s-%(format)s-%(id)s.%(ext)s" --no-playlist -fbest'
alias yautube-dl='/usr/bin/youtube-dl --no-part -A -xk --audio-format mp3 --audio-quality 0 -fbest'
alias wget='wget -Sc'
# alias ssu='sudo su ; exit'
# alias ssu="tmux split-window 'sudo su ; exit'"
alias pivotapp="ssh -t pivotweb 'ssh -t apps env LD_LIBRARY_PATH=/usr/local/lib:/lib:/usr/lib tmux attach'"
alias mpg123='mpg123 -C'
alias guile='rlwrap guile'
alias racket='rlwrap racket'
alias bobot='bobot++ -d ~/.bobot/'
alias asdfg='setxkbmap -option compose:caps -variant intl dvorak'
alias aoeui='setxkbmap -option compose:caps -variant intl dvorak'
alias rails='rlwrap rails'
alias irb='rlwrap irb'

bindkey -v

mkcd()
{
	mkdir -p "$1" && cd "$1"
}

ssu()
{
  tmux split-window $* 'sudo su; exit'
}

_macronesia()
{
  local -a options
  options=(web fetch pull mixer singer train)
  _describe 'values' options
}

session_expansion_routine()
{
  # tmux bind-key -n F5 select-pane -t 1 \; send-keys C-c C-l "make test" C-l C-m \; select-pane -t 0
  # tmux bind-key -n F6 select-pane -t 1 \; send-keys C-c C-l "make install" C-l C-m \; select-pane -t 0

  for wd in `workdirectories_routine`
  do
    source ${wd}/.tmuxrc
    init_tmux_windows ${wd}
  done
}

TVZRC=~/.tvzrc
test -f $TVZRC && source $TVZRC

unbind_all_keys()
{
  for key in F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12 F13 F14 F15
  do
    tmux unbind-key -n ${key}
  done
}

commence()
{
  cd ~
  # unbind_all_keys
  # tmux
  # tmux new-session -AD -n Basic
  tmux bind-key -n F5 select-pane -t 1 \; send-keys C-c C-l "make test" C-m \; select-pane -t 0
  tmux bind-key -n F6 select-pane -t 1 \; send-keys C-c C-l "make install" C-m \; select-pane -t 0
  tmux bind-key -n F7 select-pane -t 1 \; send-keys C-c C-l "make publish" C-m \; select-pane -t 0
  tmux bind-key -n F8 select-pane -t 1 \; send-keys C-c C-l "make clean" C-m \; select-pane -t 0
  tmux split-window -h -p 40
  for sr in mailbox_setup_routine downloads_setup_routine newsreader_setup_routine
  do
    ${sr}
    tmux select-pane -t 0
  done

  session_expansion_routine
}

compdef _macronesia macronesia
