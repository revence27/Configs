install: .zshrc .vimrc .tvzrc .ide.vim .bitchxrc .w3m/keymap
	git checkout `hostname`
	cp .zshrc ~/.zshrc
	cp .vimrc ~/.vimrc
	cp .tvzrc ~/.tvzrc
	cp .ide.vim ~/.ide.vim
	cp .bitchxrc ~/.bitchxrc
	cp .w3m/keymap ~/.w3m/keymap

llatsni: ~/.zshrc ~/.vimrc ~/.tvzrc ~/.ide.vim ~/.bitchxrc ~/.w3m/keymap
	git checkout `hostname`
	cp ~/.zshrc .zshrc
	cp ~/.vimrc .vimrc
	cp ~/.tvzrc .tvzrc
	cp ~/.ide.vim .ide.vim
	cp ~/.bitchxrc .bitchxrc
	cp ~/.w3m/keymap .w3m/keymap

publish:
	git add --all && git commit && git push -u
