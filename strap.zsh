#!/usr/bin/env zsh
sudo pacman -Syu --noconfirm dash the_silver_searcher python-pip git neovim ctags python-wheel docker redshift xsel
sudo pip2 install neovim
git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git "$HOME/.config/nvim/bundle"
gem install curses
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
${HOME}/.fzf/install
dir=${0:a:h}
export ZPREZD=$HOME/${dir:t}
export ZRCD=${ZPREZD}/runcoms
export ZBIND=${ZPREZD}/bin
export ZDOTD=${ZPREZD}/dotfiles
for f in backup swap .undo info; do
    mkdir -p ${HOME}/.config/nvim/files/${f}
done
for f in astylerc zlogin zlogout zpreztorc zprofile zshenv zshrc; do
  [[ -e ${HOME}/.${f} ]] && rm ${HOME}/.${f}
  ln -s ${ZRCD}/${f} ${HOME}/.${f}
done
echo 'done linking runcoms'
mkdir -p ${HOME}/bin
for b in mayberedshift.dash clipmenu.bash clipmenud.bash keymod.dash diskspace.dash pymodoro-out.dash start-pomodoro.py; do
  local f=$HOME/bin/${b:r}
  [[ -e ${f} ]] && rm ${f}
  ln -s ${ZBIND}/${b} ${f}
done
echo 'done linking bins'
export GITAPPSD=${HOME}/apps-git
mkdir -p ${GITAPPSD}
for get in ${ZBIND}/getscripts/core/*; do
  echo "getting ${get}"
  exec 1>/dev/null
  exec 2>/dev/null
  ${get}
  exec 1>/dev/tty
  exec 2>/dev/tty
done
local DEST=${HOME}/.byobu
mkdir -p ${DEST}
ln -s ${ZDOTD}/byobu/keybindings.tmux ${DEST}/keybindings.tmux
ln -s ${ZDOTD}/byobu/status ${DEST}/status
ln -s ${ZDOTD}/byobu/tmux.conf ${DEST}/.tmux.conf
ln -s ${ZDOTD}/byobu/profile.tmux ${DEST}/profile.tmux
DEST=${HOME}/.config/pymodoro
mkdir -p ${DEST}
ln -s ${ZDOTD}/pymodoro/config ${DEST}/config
[[ -e ${ZDOTD}/nvim/init.vim⋅$HOME/.config/nvim┊ ]] || ln -s ${ZDOTD}/nvim/init.vim $HOME/.config/nvim
git config --global user.name "Nate"
git config --global user.email "tulanthoar@gmail.com"
git config --global credential.https://github.com.username "tulanthoar"
