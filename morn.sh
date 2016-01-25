#!  /bin/sh

tmux new-window -n morn 'mutt'
tmux set-option remain-on-exit on
tmux split-window -h -p 30 'w3m http://webmail.pivotaccess.com/'
tmux split-window -v -t 1 -p 30 -c ~/Desktop/Misc/Music 'zsh'
tmux split-window -v -t 0 -p 20 -c ~/Downloads/vidfiles

tmux split-window -h -t 3 -p 70 'weechat irc://LeCamarade:camarade@irc.freenode.net/#haskell,#yesod
'
tmux send-keys -t 0 I
tmux send-keys -t 2 'mpg123 -CZ *.mp3' C-l
