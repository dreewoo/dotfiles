DOTFILES_DIR := $(shell pwd)
DEST_DIR = ${HOME}

all: zsh X i3 git vim

X:
	ln -fs ${DOTFILES_DIR}/xinitrc ${DEST_DIR}/.xinitrc
	ln -fs ${DOTFILES_DIR}/Xresources ${DEST_DIR}/.Xresources

i3:
	ln -fs ${DOTFILES_DIR}/i3 ${DEST_DIR}/.i3
	ln -fs ${DOTFILES_DIR}/i3status ${DEST_DIR}/.i3status

zsh:
	ln -fs ${DOTFILES_DIR}/zshrc ${DEST_DIR}/.zshrc

vim:
	ln -fs ${DOTFILES_DIR}/vimrc ${DEST_DIR}/.vimrc
	ln -fs ${DOTFILES_DIR}/vim ${DEST_DIR}/.vim

git:
	ln -fs ${DOTFILES_DIR}/gitconfig ${DEST_DIR}/.gitconfig


