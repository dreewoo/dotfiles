DOTFILES_DIR := $(shell pwd)
DEST_DIR = ${HOME}

all: zsh X i3wm git vimfiles

X:
	ln -fs ${DOTFILES_DIR}/xinitrc ${DEST_DIR}/.xinitrc
	ln -fs ${DOTFILES_DIR}/Xresources ${DEST_DIR}/.Xresources
	ln -fs ${DOTFILES_DIR}/xrandr ${DEST_DIR}/.xrandr

i3wm:
	ln -fns ${DOTFILES_DIR}/i3 ${DEST_DIR}/.i3
	ln -fs ${DOTFILES_DIR}/i3status ${DEST_DIR}/.i3status

zsh:
	ln -fs ${DOTFILES_DIR}/zshrc ${DEST_DIR}/.zshrc

vimfiles:
	ln -fs ${DOTFILES_DIR}/vimrc ${DEST_DIR}/.vimrc
	ln -fns ${DOTFILES_DIR}/vim ${DEST_DIR}/.vim

git:
	ln -fs ${DOTFILES_DIR}/gitconfig ${DEST_DIR}/.gitconfig

