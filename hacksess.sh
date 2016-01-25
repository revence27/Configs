#!  /bin/sh

tmux new-window mutt
tmux set-option remain-on-exit on
tmux split-window -h -p 30 'w3m http://webmail.pivotaccess.com/'
tmux split-window -v -p 25 -t 1 -c ~/Desktop/Misc/Music zsh

tmux send-keys -t 0 I
tmux send-keys -t 2 'mpg123 -ZC *.mp3' C-l

tmux send-keys -t 1 TU C-u 'http://rt.com/' C-m
tmux send-keys -t 1 TU C-u 'http://news.vice.com/' C-m
tmux send-keys -t 1 TU C-u 'http://localhost:3000/' C-m
tmux send-keys -t 1 '{{{'
tmux rename-window -t 0 'Controls'

cd ~/Documents/Hacks/sundry/todolist
tmux new-window -n 'Hackings' 'vi -S config/ide.vim'
tmux set-option remain-on-exit on
tmux split-window -h -p 30 'psql todolist todolist'
tmux split-window -v -p 70 -t 1 'stack build && stack exec -- yesod devel'

tmux move-window -s 0 -t 3
tmux move-window -s 1 -t 0
tmux move-window -s 2 -t 1
tmux kill-window -t 3
