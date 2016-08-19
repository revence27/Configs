install: .zshrc .vimrc .tvzrc .bitchxrc .w3m/keymap .tmux.conf
	#	git checkout `hostname`
	cp .zshrc ~/.zshrc
	cp .vimrc ~/.vimrc
	cp .tvzrc ~/.tvzrc
	cp .bitchxrc ~/.bitchxrc
	cp .w3m/keymap ~/.w3m/keymap
	cp .tmux.conf ~/.tmux.conf

llatsni: ~/.zshrc ~/.vimrc ~/.tvzrc ~/.bitchxrc ~/.w3m/keymap ~/.tmux.conf
	#	git checkout `hostname`
	cp ~/.zshrc .zshrc
	cp ~/.vimrc .vimrc
	cp ~/.tvzrc .tvzrc
	cp ~/.bitchxrc .bitchxrc
	cp ~/.w3m/keymap .w3m/keymap
	cp ~/.tmux.conf .tmux.conf

publish:
	git add --all && git commit && git push -u
