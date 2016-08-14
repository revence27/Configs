install: .zshrc .vimrc .tvzrc .bitchxrc .w3m/keymap
	#	git checkout `hostname`
	cp .zshrc ~/.zshrc
	cp .vimrc ~/.vimrc
	cp .tvzrc ~/.tvzrc
	cp .bitchxrc ~/.bitchxrc
	cp .w3m/keymap ~/.w3m/keymap

llatsni: ~/.zshrc ~/.vimrc ~/.tvzrc ~/.bitchxrc ~/.w3m/keymap
	#	git checkout `hostname`
	cp ~/.zshrc .zshrc
	cp ~/.vimrc .vimrc
	cp ~/.tvzrc .tvzrc
	cp ~/.bitchxrc .bitchxrc
	cp ~/.w3m/keymap .w3m/keymap

publish:
	git add --all && git commit && git push -u
