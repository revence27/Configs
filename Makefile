install: ~/.zshrc ~/.vimrc ~/.tvzrc ~/.ide.vim
	git checkout `hostname`
	cp .zshrc ~/.zshrc
	cp .vimrc ~/.vimrc
	cp .tvzrc ~/.tvzrc
	cp .ide.vim ~/.ide.vim

llatsni: .zshrc .vimrc .tvzrc .ide.vim
	git checkout `hostname`
	cp ~/.zshrc .zshrc
	cp ~/.vimrc .vimrc
	cp ~/.tvzrc .tvzrc
	cp ~/.ide.vim .ide.vim
