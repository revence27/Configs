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
setxkbmap -layout dvorak -variant intl -option caps:compose
bindkey -v

tmuxise()
{
	tmux
}

retmuxise()
{
	tmux attach
}

conditionally_tmuxise()
{
	( test -z "$TMUX" && tmuxise )
}

conditionally_tmuxise


# User configuration
export set DLDIR="$HOME/Downloads"
export set YTDIR="$DLDIR/vidfiles/yt"
export set HACKS="$HOME/Documents/Hacks"
export set QMSI_ROOT="$HACKS/qmsi"
export set ISSM_BSP="$HACKS/issm/firmware/bsp/1.0"
export set ISSM_ROOT="$HACKS/issm-lx"
export set IAMCU_TOOLCHAIN_DIR="$ISSM_ROOT/tools/compiler/gcc-ia/5.2.1/bin"
export set ARCMCU_TOOLCHAIN_DIR="$ISSM_ROOT/tools/compiler/gcc-arc/4.8.5/bin"
export set OPENOCD_DIR="$ISSM_ROOT/tools/debugger/openocd"
export set OPENOCD_WDIR="$OPENOCD_DIR/scripts"
export set OPENOCD_TOOL="$OPENOCD_DIR/bin/openocd"
export set OPENOCD_CONF="$OPENOCD_DIR/scripts/board/quark_d2000_onboard.cfg"
export set QUARK_TTY_DEVICE="/dev/ttyUSB1"
export set QUARK_TTY_BAUDRT=115200
export set NETWORKCONTENT="$HACKS/content"
export set WINFILES="$NETWORKCONTENT/files"
export set WINPROJS="$NETWORKCONTENT/windows"

export set P61="/home/revence/Hacks/rakudo-star-2017.01"
export set P61BIN="$P61/install/bin"
export set P62BIN="$P61/install/share/perl6/site/bin"
export set PATH="$ISSM_ROOT:$ISSM_ROOT/tools/compiler/bin:$HACKS/sundry/bin:$GOROOT:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$P61BIN:$P62BIN:$PATH"
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
export LANG=en_GB.UTF-8
export CHARSET=UTF-8
export LANGUAGE=en:en_GB
export LC_ALL=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8
export LC_TIME=en_GB.UTF-8
export LC_PAPER=en_GB
export LC_NUMERIC=en_GB.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MEASUREMENT=en_GB
export LC_IDENTIFICATION=en_US
export LC_ADDRESS=rw_RW
export IRCNICK="LeCamarade"
export IRCUSER="LeCamarade"
export IRCNAME="LeCamarade"
export IRCSERVER="irc.freenode.net"

alias ls='ls -G'
alias ping='ping -a'
alias sml='rlwrap sml'
alias ocaml='rlwrap ocaml'
alias youtube-dl='youtube-dl --write-sub --sub-lang en,fr --no-part -o "%(title)s-%(format)s-%(id)s.%(ext)s" --no-playlist -fbest'
alias yautube-dl='/usr/local/bin/youtube-dl --no-part -A -xk --audio-format mp3 --audio-quality 0 -fbest'
alias wget='wget -Sc'
alias scyfy="ssh -t scyfy 'tmux attach'"
alias mpg123='mpg123 -C'
alias guile='rlwrap guile'
alias racket='rlwrap racket'
alias bobot='bobot++ -d ~/.bobot/'
alias asdfg='setxkbmap -option compose:caps -variant intl dvorak'
alias aoeui='setxkbmap -option compose:caps -variant intl dvorak'
alias rails='rlwrap rails'
alias irb='rlwrap irb'
alias vi='vim'

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
  for wd in `workdirectories_routine`
  do
    source ${wd}/.tmuxrc
    init_tmux_windows ${wd}
  done
}

project_init()
{
  source .tmuxrc && init_tmux_windows `pwd`
}

TVZRC=~/.tvzrc
test -f $TVZRC && source $TVZRC

rebind_tmux_keys()
{
  tmux bind-key -n S-Left     previous-window
  tmux bind-key -n S-Right    next-window
  tmux bind-key -n S-M-Right  select-pane -R
  tmux bind-key -n S-M-Left   select-pane -L
  tmux bind-key -n S-M-Up     select-pane -U
  tmux bind-key -n S-M-Down   select-pane -D
  tmux bind-key -n M-Right    send-keys      Escape C-w Right
  tmux bind-key -n M-Left     send-keys      Escape C-w Left
  tmux bind-key -n M-Down     send-keys      Escape C-w Down
  tmux bind-key -n M-Up       send-keys      Escape C-w Up
  # tmux bind-key -n C-r        send-keys      Escape C-c C-l Up C-m
  tmux bind-key -n C-PgDn     run-shell -b 'tmux send-keys -t `tmux show-environment EDITOR_PANE | cut -d= -f2` gt'
  tmux bind-key -n C-PgUp     run-shell -b 'tmux send-keys -t `tmux show-environment EDITOR_PANE | cut -d= -f2` gT'
  tmux bind-key -n C-s        run-shell -b 'tmux send-keys -t `tmux show-environment EDITOR_PANE | cut -d= -f2` Escape Escape ":w" C-m Escape a'
  tmux bind-key -n S-F4       run-shell -b 'tmux send-keys -t `tmux show-environment EDITOR_PANE | cut -d= -f2` Escape Escape ":x" C-m C-l C-d'
  tmux bind-key -n F4         run-shell -b 'tmux send-keys -t `tmux show-environment EDITOR_PANE | cut -d= -f2` Escape Escape ":xa" C-m C-l C-d'
  tmux bind-key -n F5         run-shell -b 'tmux send-keys -t `tmux show-environment COMPILER_PANE | cut -d= -f2` C-c C-l "`tmux show-environment COMPILE_COMMAND | cut -d= -f2-`" C-m'
  tmux bind-key -n S-F5       run-shell -b 'tmux send-keys "vi -S .ide.vim" C-m'
  tmux bind-key -n F6         run-shell -b 'tmux send-keys -t `tmux show-environment COMPILER_PANE | cut -d= -f2` C-c C-l "make install" C-m'
  tmux bind-key -n F7         run-shell -b 'tmux send-keys -t `tmux show-environment COMPILER_PANE | cut -d= -f2` C-c C-l "make publish" C-m'
  tmux bind-key -n F8         run-shell -b 'tmux send-keys -t `tmux show-environment COMPILER_PANE | cut -d= -f2` C-c C-l "make clean" C-m'
  tmux bind-key -n F9         run-shell -b 'tmux send-keys -t `tmux show-environment COMPILER_PANE | cut -d= -f2` C-c C-l "make publish" C-m'
}

misc_tmux_options()
{
  # tmux set-option         -sg escape-time 0
  # tmux setw               -g mode-mouse on
  # tmux setw               -g monitor-activity on
  # tmux setw               -gq mode-keys vi
  # tmux set-option         -gq status-keys vi
  tmux set-environment        EDITOR_PANE    0
  tmux set-environment        COMPILER_PANE  1
  tmux set-environment        DEBUGGER_PANE  3
  tmux set-option         -gq history-limit 10000
  tmux set-option         -gq default-terminal "screen-256color"
  # tmux set-option         -g  allow-rename off
  # tmux set-option         -gq automatic-rename off
  # tmux set-window-option  -gq automatic-rename off
  # tmux set-window-option  -gq automatic-rename on
  # tmux set-option         -g set-titles on
  tmux set-option         -gq status-bg green
  tmux set-option         -gq status-fg black
  tmux set-option         -gq window-status-current-bg white
  tmux set-option         -gq window-status-current-fg black
  tmux set-option         -gq window-status-current-attr bold
  tmux set-option         -gq status-interval 60
  tmux set-option         -gq status-left-length 30
  tmux set-option         -gq status-right-length 60
  tmux set-option         -gq status-left '#[fg=black][#S]#[default]' ##[fg=white]#(cut -d " " -f 1-3 /proc/loadavg)'
  tmux set-option         -gq status-right '#[fg=yellow]%H:%M#[default] #[fg=white]#(whoami)@#H#[default] #[fg=yellow]%A, %d %B, %Y#[default]'
}

tmux_desktop_environment()
{
  # tmux rename-session $DESKTOPSESSIONNAME
  tmux rename-window 'Desktop'
  tmux split-window -t 'Desktop.0' -h -p 40
  for sr in mailbox_setup_routine downloads_setup_routine newsreader_setup_routine
  do
    ${sr} $MAINWORKDIR
    tmux select-pane -l
  done
}

start_tmux_desktop()
{
  tmux_desktop_environment
  session_expansion_routine
}

downloads_setup_routine()
{
  tmux split-window -t 'Desktop.0' -p 15 -c "$DLDIR"
  tmux send-keys -t 'Desktop.3' "$YTDL " C-l
}

commence()
{
  cd ~
  # tmux
  # tmux new-session -AD -n Basic
  misc_tmux_options
  rebind_tmux_keys
  #start_tmux_desktop
}

compdef _macronesia macronesia
