#!/bin/env zsh
ZPREZD=${0:h}
ZRCD=${ZPREZD}/runcoms
ZBIND=${ZPREZD}/bin
ZDOTD=${ZPREZD}/dotfiles
for f in Xresources xserverrc zlogin zlogout zpreztorc zprofile zshenv zshrc; do
  ln -s ${ZRCD}/${f} ${HOME}/.${f}
done
mkdir -p ${HOME}/bin
for b in clipmenu.bash clipmenud.bash corezerot.dash diskspace.dash maybeclipmenud.dash mayberedshift.dash modkey.dash pymodoro-out.dash quteprint.dash search.dash start-pomodoro.py; do
  t=echo "${b}" | perl -p -e 's/\.(py|[bd]ash)//; chomp'
  ln -s ${ZBIND}/${b} ${HOME}/bin/${t}
done
mkdir -p ${HOME}/apps-git
for get in ${ZBIND}/getscripts/*; do
  eval "${get}"
done
DEST=${HOME}/.byobu
mkdir -p ${DEST}
ln -s ${ZDOTD}/byobu/keybindings.tmux ${DEST}/keybindings.tmux
ln -s ${ZDOTD}/byobu/status ${DEST}/status
ln -s ${ZDOTD}/byobu/tmux.conf ${DEST}/.tmux.conf
DEST=${HOME}/.config/nvim/bundle/perl-support/templates
mkdir -p ${DEST}
ln -s ${ZDOTD}/nvim/bundle/perl-support/templates/comments.templates ${DEST}/comments.templates
DEST=${HOME}/.config/pymodoro
mkdir -p ${DEST}
ln -s ${ZDOTD}/pymodoro/config ${DEST}/config
DEST=${HOME}/.config/qutebrowser
mkdir -p ${DEST}
ln -s ${ZDOTD}/qutebrowser/keys.conf ${DEST}/keys.conf
ln -s ${ZDOTD}/qutebrowser/qutebrowser.conf ${DEST}/qutebrowser.conf
DEST=/usr/lib/urxvt/perl
sudo mkdir -p ${DEST}
sudo ln -s ${ZDOTD}/urxvt/autocomplete-ALL-the-things ${DEST}/autocomplete-ALL-the-things
sudo ln -s ${ZDOTD}/urxvt/fifo ${DEST}/fifo
DEST=${HOME}/.xmonad
mkdir -p ${DEST}
ln -s ${ZDOTD}/xmonad/xmonad.hs ${DEST}/xmonad.hs
ln -s ${ZDOTD}/xmonad/xmctl.hs ${DEST}/xmctl.hs
