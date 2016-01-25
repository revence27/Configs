#!  /bin/sh

cd ~/Documents/Hacks/sundry/todolist
tmux new-window -n yesodier
tmux set-option remain-on-exit on
tmux split-window -v -p 15 'ocaml'
tmux split-window -v -t 0 -p 75 'stack build && stack exec -- yesod devel'

tmux split-window -h -t 0 -p 85 'ruby -e "loop {system %[sl -l]}"'
tmux split-window -h -t 3 -p 70 'git log'

tmux split-window -h -t 2 -p 80 'vi -S config/ide.vim'
tmux split-window -h -t 5 -p 25 'w3m http://webmail.pivotaccess.com/'

tmux split-window -h -t 1 -p 40 'ghci'
tmux split-window -h -t 1 -p 40 'guile'
tmux split-window -h -t 1 -p 50 'sml'

tmux clock-mode -t 0
