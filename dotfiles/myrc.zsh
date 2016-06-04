cdParentKey() {
  BUFFER=""
  pushd .. > /dev/null
  echo && ls -lhF
  zle accept-line
}
cdUndoKey() {
  BUFFER=""
  pushd -q +1 > /dev/null
  echo && ls -lhF
  zle accept-line
}
cdRedoKey () {
  BUFFER=""
  pushd -q -0 > /dev/null
  echo && ls -lhF
  zle accept-line
}
function percol_select_history() {
  BUFFER=$(fc -l -n 1 | eval tac | percol --query "$LBUFFER")
  CURSOR=$#BUFFER         # move cursor
  zle -R -c               # refresh
}
function fpp_pipe() {
  BUFFER="$BUFFER | fpp"
  zle accept-line
}
function copydir {
  print -n $PWD | xsel -i > /dev/null
}
function copyfile {
  cat $1 | xsel -i > /dev/null
}
sudo-command-line() {
  [[ -z $BUFFER ]] && zle up-history
  [[ $BUFFER == sudo\ * ]] && LBUFFER="${LBUFFER#sudo }" || LBUFFER="sudo $LBUFFER"
}
function p-paste() {
  local words=$(xclip -o)
  RBUFFER="$words${RBUFFER}"
  zle -R -c
}
function c-paste() {
  local words=$(xclip -o -sel clip)
  RBUFFER="$words${RBUFFER}"
  zle -R -c
}
fuck-command-line() {
  local FUCK="$(THEFUCK_REQUIRE_CONFIRMATION=0 thefuck $(fc -ln -1 | tail -n 1) 2> /dev/null)"
  [[ -z $FUCK ]] && echo -n -e "\a" && return
  BUFFER=$FUCK
  zle end-of-line
}
suggest-accept-return(){
  zle vi-end-of-line
  zle accept-line
}
fasd-nvim(){
  nvim `fasd -f -i $1`
}
zle -N fuck-command-line
zle -N cdParentKey
zle -N cdUndoKey
zle -N insert-cycledleft
zle -N insert-cycledright
zle -N suggest-accept-return
zle -N fpp_pipe
zle -N percol_select_history
zle -N p-paste
zle -N c-paste
zle -N sudo-command-line

alias grep='grep --color'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias suspendnow="sudo pm-suspend"
alias -g Y="| yank"
alias -g Yl="| yank -l"
alias -g FP="| fpp"
alias v="fasd-nvim"
alias vim="nvim"
alias vi="nvim"
alias ex="unarchive"
alias c="cd"
alias btx="byobu-tmux"
alias btxns="byobu-tmux new-session"
alias pyls="fasd -f -i -e python3 .py$"
alias x="exit"
alias xmo="mod_key_lay"
alias cpf='copyfile'
alias cpd='copydir'
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias l='ls -lhF'      #long list
alias lh='ls -lhF .*'
alias Fd='fasd -d -i'
alias Ff='fasd -f -i'
alias Fa='fasd -a -i'
alias help='man'
alias unexport='unset'
alias whereami=display_info
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
alias blueconnect='dbus-send --system --type=method_call --dest=org.bluez /org/bluez/hci0/dev_1C_B7_2C_53_28_DA org.bluez.Network1.Connect string:"nap"'
alias gparted='sudo gparted'
alias usbdhcp='sudo dhcpcd'
alias bluectl='sudo bluetoothctl'

export LD_LIBRARY_PATH=/home/ant/apps/code/lib
export JAVA_HOME="/usr/lib/jvm/default-jvm"
export GOPATH="$HOME/golang"
[[ -d "$GOPATH" ]] && export PATH="$PATH:$GOPATH/bin"

function mod_key_lay(){
  xmodmap "$ZPREZD/dotfiles/xmodm";
  setxkbmap -option altwin:alt_super_win -option shift:both_shiftlock;
  xmodmap "$ZPREZD/dotfiles/xmodm";
  numlockx
}
function bind_keys() {
  bindkey -M viins "^Z" vi-cmd-mode
  bindkey -M viins "^A" beginning-of-line
  bindkey -M viins "^[ " suggest-accept-return
  bindkey -M viins "^@" vi-forward-word
  bindkey -M viins "^[d" insert-cycledright
  bindkey -M viins "^[u" insert-cycledleft
  bindkey -M viins "^[c" yank_pipe
  bindkey -M viins "^[p" fpp_pipe
  bindkey -M viins "^[h" anyframe-widget-execute-history
  bindkey -M viins "^[s" anyframe-widget-insert-filename
  bindkey -M viins "^[q" anyframe-widget-kill
  bindkey -M viins "^[v" c-paste
  bindkey -M viins "^[f" forward-word
  bindkey -M viins "^[b" backward-word
  bindkey -M viins "^B" cdUndoKey
  bindkey -M viins "^F" cdRedoKey
  bindkey -M viins "^P" cdParentKey
  bindkey -rM viins "^[";
  bindkey -M viins "\e" vi-cmd-mode;
  bindkey -M viins "^[[3~" vi-delete-char;
  bindkey -M vicmd "\e" sudo-command-line
  bindkey -M vicmd "\t" fuck-command-line
  bindkey -M viins "?" percol_select_history
  bindkey -M vicmd ":" percol_select_history
}
