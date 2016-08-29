#!/bin/env zsh
sudo pacman -Syu --noconfirm dash the_silver_searcher python-pip neovim ctags python-neovim docker> /dev/null
sudo usermod -aG docker $USER
dir=${0:a:h}
export ZPREZD=$HOME/${dir:t}
export ZRCD=${ZPREZD}/runcoms
export ZBIND=${ZPREZD}/bin
export ZDOTD=${ZPREZD}/dotfiles
for f in zlogin zlogout zpreztorc zprofile zshenv zshrc; do
  [[ -e ${HOME}/.${f} ]] && rm ${HOME}/.${f}
  ln -s ${ZRCD}/${f} ${HOME}/.${f}
done
echo 'done linking runcoms'
mkdir -p ${HOME}/bin
for b in diskspace.dash pymodoro-out.dash start-pomodoro.py; do
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
gem install curses
DEST=${HOME}/.byobu
mkdir -p ${DEST}
ln -s ${ZDOTD}/byobu/keybindings.tmux ${DEST}/keybindings.tmux
ln -s ${ZDOTD}/byobu/status ${DEST}/status
ln -s ${ZDOTD}/byobu/tmux.conf ${DEST}/.tmux.conf
ln -s ${ZDOTD}/byobu/profile.tmux ${DEST}/profile.tmux
DEST=${HOME}/.config/pymodoro
mkdir -p ${DEST}
ln -s ${ZDOTD}/pymodoro/config ${DEST}/config
curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s > /dev/null
DEST=${HOME}/.config/nvim/bundle
mkdir -p ${DEST}
git clone https://github.com/VundleVim/Vundle.vim.git ${DEST}/Vundle.vim &> /dev/null
mkdir -p ${HOME}/.config/nvim/files/{undo,backup,swap,info}
mkdir -p ${HOME}/.local/share/nvim/{swap,site,shada,view}
ln -s ${ZDOTD}/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s ${ZDOTD}/nvim/ro.vim $HOME/.config/nvim/ro.vim
perl <"$ZDOTD/nvim/init.vim" -p -e 's/^colorscheme kolor$//' > /tmp/viminit
nvim -u /tmp/viminit +PluginInstall +qall
git config --global user.name "Nate"
git config --global user.email "tulanthoar@gmail.com"
sudo pip install ptpython > /dev/null
