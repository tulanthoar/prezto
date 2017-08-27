alias swappone='tmux swap-window -t:+'
alias drun='docker run -it --rm'
alias pl='perl'
alias pli='sudo cpanm'
alias pld='perldoc'
alias py='python'
alias pyi='sudo pip install --upgrade'
alias pys='pip search'
alias grep='grep --color'
alias df='df -h'
alias du='du -h'
alias fzf='fzf-tmux'
alias sx='startx'
alias x='exit'
alias cpf='copyfile'
alias cpd='echo -n ${PWD}|xsel -i &> /dev/null'
alias la='ls -AFh'
alias lla='ls -lAFh'
alias l='ls -hF'
alias ll='ls -lhF'
alias lh='ls -lhF .*'
alias l1='ls -1F'
alias l1a='ls -1AF'
alias ln='ln -i'
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias gparted='sudo gparted'
alias bluectl='sudo bluetoothctl'
alias suspendnow="systemctl suspend"
alias czp="cd ${ZPREZD}; la"
alias ex='unarchive'
alias nvim="python3 ${ZRCD}/scripts/omnivim.py"
alias j4-menu='j4-dmenu-desktop --display-binary --term=urxvt --dmenu="dmenu -w 600 -y 15 -z -p launch -l 50"'
alias colorb16="source ${HOME}/.base16_theme"
alias aurinstall='makepkg -si'
alias aurremove='makepkg -r'
alias makearduino="make upload reset_stty"
alias heartbeat-off="echo 'none' | sudo tee /sys/class/leds/user_led1/trigger"
alias st-flash-767='st-flash write "BUILD/NUCLEO_F767ZI/GCC_ARM/${PWD:A:t}.bin" 0x8000000'
alias st-flash-432='st-flash write "BUILD/NUCLEO_L432KC/GCC_ARM/${PWD:A:t}.bin" 0x8000000'
alias st-flash-96B='st-flash write "BUILD/B96B_F446VE/GCC_ARM/${PWD:A:t}.bin" 0x8000000'
alias nvf='nvim $(fzf --preview "cat {}")'
alias cdf='cd $(find $PWD -type d | fzf --preview "ls -al {}")'
alias untar='unarchive';
