alias nvim='nvim -u $ZDOTD/nvim/init.vim'
alias bka='cdbk -a'
alias bkl='cdbk -l'
alias bkr='cdbk -r'
alias pl='perl '
alias pli='sudo cpanm '
alias pld='perldoc '
alias py='python '
alias pyi='sudo pip install '
alias grep='grep --color '
alias df='df -h '
alias du='du -h'
alias fzf='fzf-tmux '
alias unmark='dmark'
alias x='exit '
alias cpf='copyfile '
alias cpd="echo ${PWD}|xsel -i &> /dev/null "
alias la='ls -AFh '
alias lla='ls -lAFh '
alias l='ls -hF '
alias ll='ls -lhF '      #long list
alias lh='ls -lhF .* '
alias l1='ls -1F'
alias l1a='ls -1AF'
alias ln='ln -i '
alias rm='rm -I '
alias cp='cp -i '
alias mv='mv -i '
alias mkdir='mkdir -p'
alias gparted='sudo gparted '
alias bluectl='sudo bluetoothctl '
alias suspendnow="systemctl suspend "
alias czp="cd ${ZPREZD}; la "
alias ex='unarchive '
snippet-add wi "sudo wifi-menu"
snippet-add t "|tail -n10"
snippet-add h "|head -n10"
snippet-add g "|grep "
snippet-add l "|less "
snippet-add f "|fpp "
snippet-add add "git status | fpp"
snippet-add push "git commit && git push"
snippet-add s "startx"
