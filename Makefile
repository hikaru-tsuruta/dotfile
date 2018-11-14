DOT_FILES = .vim .vimrc .gitconfig .gitignore .gemrc .rspec .bash_profile

all: install

install: $(foreach f, $(DOT_FILES), install-file-$(f))

install-file-%: %
	@echo "Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<
