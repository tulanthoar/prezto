#!/bin/env zsh
sudo pacman -Syu --noconfirm dash the_silver_searcher python-pip cpanminus gparted mlocate ipython neovim ctags python-neovim > /dev/null
dir=${0:a:h}
export ZPREZD=$HOME/${dir:t}
export ZRCD=${ZPREZD}/runcoms
export ZBIND=${ZPREZD}/bin
export ZDOTD=${ZPREZD}/dotfiles
for f in Xresources xserverrc zlogin zlogout zpreztorc zprofile zshenv zshrc xinitrc; do
  [[ -f ${HOME}/.${f} ]] && rm ${HOME}/.${f}
  ln -s ${ZRCD}/${f} ${HOME}/.${f}
done
mkdir -p ${HOME}/bin
for b in clipmenu.bash clipmenud.bash corezerot.dash diskspace.dash maybeclipmenud.dash mayberedshift.dash modkey.dash pymodoro-out.dash quteprint.dash search.dash start-pomodoro.py; do
  t=$(echo "${b}" | perl -p -e 's/\.(py|[bd]ash)//; chomp')
  ln -s ${ZBIND}/${b} ${HOME}/bin/${t}
done
export GITAPPSD="${HOME}/apps-git"
mkdir -p ${GITAPPSD}
for get in ${ZBIND}/getscripts/core/*; do
  exec 1>/dev/null
  exec 2>/dev/null
  ${get}
  exec 1>/dev/tty
  exec 2>/dev/tty
done
local fzfbmarks="$HOME/.fzfbmarks"
[[ -f $fzfbmarks ]] || touch $fzfbmarks
DEST=${HOME}/.byobu
mkdir -p ${DEST}
ln -s ${ZDOTD}/byobu/keybindings.tmux ${DEST}/keybindings.tmux
ln -s ${ZDOTD}/byobu/status ${DEST}/status
ln -s ${ZDOTD}/byobu/tmux.conf ${DEST}/.tmux.conf
ln -s ${ZDOTD}/byobu/profile.tmux ${DEST}/profile.tmux
DEST=${HOME}/.config/pymodoro
mkdir -p ${DEST}
ln -s ${ZDOTD}/pymodoro/config ${DEST}/config
DEST=${HOME}/.config/qutebrowser
mkdir -p ${DEST}
ln -s ${ZDOTD}/qutebrowser/keys.conf ${DEST}/keys.conf
ln -s ${ZDOTD}/qutebrowser/qutebrowser.conf ${DEST}/qutebrowser.conf
DEST=${HOME}/.config
ln -s ${ZDOTD}/redshift/redshift.conf ${DEST}/redshift.conf
DEST=${HOME}/.xmonad
mkdir -p ${DEST}
ln -s ${ZDOTD}/xmonad/xmonad.hs ${DEST}/xmonad.hs
ln -s ${ZDOTD}/xmonad/xmctl.hs ${DEST}/xmctl.hs
curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s
DEST=${HOME}/.config/nvim/bundle
mkdir -p ${DEST}
git clone https://github.com/VundleVim/Vundle.vim.git ${DEST}/Vundle.vim
mkdir -p ${HOME}/.config/nvim/files/{undo,backup,swap,info}
mkdir -p ${HOME}/.local/share/nvim/{swap,site,shada,view}
ln -s ${ZDOTD}/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s ${ZDOTD}/nvim/ro.vim $HOME/.config/nvim/ro.vim
perl <"$ZDOTD/nvim/init.vim" -p -e 's/^colorscheme kolor$//' > /tmp/viminit
nvim -u /tmp/viminit +PluginInstall +qall
git config --global user.name "Nate"
git config --global user.email "tulanthoar@gmail.com"
sudo pip install ptpython
