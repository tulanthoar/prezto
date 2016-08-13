#!/bin/env zsh
sudo pacman -Syu git dash
dir=${0:a:h}
export ZPREZD=$HOME/${dir:t}
export ZRCD=${ZPREZD}/runcoms
export ZBIND=${ZPREZD}/bin
export ZDOTD=${ZPREZD}/dotfiles
for f in Xresources xserverrc zlogin zlogout zpreztorc zprofile zshenv zshrc xinitrc; do
  ln -s ${ZRCD}/${f} ${HOME}/.${f}
done
mkdir -p ${HOME}/bin
for b in clipmenu.bash clipmenud.bash corezerot.dash diskspace.dash maybeclipmenud.dash mayberedshift.dash modkey.dash pymodoro-out.dash quteprint.dash search.dash start-pomodoro.py; do
  t=$(echo "${b}" | perl -p -e 's/\.(py|[bd]ash)//; chomp')
  ln -s ${ZBIND}/${b} ${HOME}/bin/${t}
done
mkdir -p ${HOME}/apps-git
export GITAPPSD="${HOME}/apps-git"
for get in ${ZBIND}/getscripts/*; do
  eval "${get}"
done
DEST=${HOME}/.byobu
mkdir -p ${DEST}
ln -s ${ZDOTD}/byobu/keybindings.tmux ${DEST}/keybindings.tmux
ln -s ${ZDOTD}/byobu/status ${DEST}/status
ln -s ${ZDOTD}/byobu/tmux.conf ${DEST}/.tmux.conf
DEST=${HOME}/.config/pymodoro
mkdir -p ${DEST}
ln -s ${ZDOTD}/pymodoro/config ${DEST}/config
DEST=${HOME}/.config/qutebrowser
mkdir -p ${DEST}
ln -s ${ZDOTD}/qutebrowser/keys.conf ${DEST}/keys.conf
ln -s ${ZDOTD}/qutebrowser/qutebrowser.conf ${DEST}/qutebrowser.conf
DEST=${HOME}/.xmonad
mkdir -p ${DEST}
ln -s ${ZDOTD}/xmonad/xmonad.hs ${DEST}/xmonad.hs
ln -s ${ZDOTD}/xmonad/xmctl.hs ${DEST}/xmctl.hs
curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s
mkdir -p ${HOME}/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
mkdir -p ${HOME}/.config/nvim/files/{undo,backup,swap,info}
sudo pacman -Syu neovim ctags xsel python-neovim
nvim +PluginInstall +qall
