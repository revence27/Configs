install: .zshrc .vimrc .tvzrc .ide.vim .bitchxrc
	git checkout `hostname`
	cp .zshrc ~/.zshrc
	cp .vimrc ~/.vimrc
	cp .tvzrc ~/.tvzrc
	cp .ide.vim ~/.ide.vim
	cp .bitchxrc ~/.bitchxrc

llatsni: ~/.zshrc ~/.vimrc ~/.tvzrc ~/.ide.vim ~/.bitchxrc
	git checkout `hostname`
	cp ~/.zshrc .zshrc
	cp ~/.vimrc .vimrc
	cp ~/.tvzrc .tvzrc
	cp ~/.ide.vim .ide.vim
	cp ~/.bitchxrc .bitchxrc

publish:
	git add --all && git commit && git push -u
