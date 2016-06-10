function cdParentKey() {
  BUFFER=""
  pushd .. > /dev/null
  echo && ls -lhF
  zle accept-line
}
function cdUndoKey() {
  BUFFER=""
  pushd -q +1 > /dev/null
  echo && ls -lhF
  zle accept-line
}
function cdRedoKey () {
  BUFFER=""
  pushd -q -0 > /dev/null
  echo && ls -lhF
  zle accept-line
}
function fpp_pipe() {
  BUFFER="$BUFFER | fpp"
  zle accept-line
}
function copydir {
  print -n "$PWD" | xclip -i -sel p &> /dev/null
}
function copyfile {
  cat "$1" | xclip -i -sel p &> /dev/null
}
function sudo-command-line() {
  [[ -z "$BUFFER" ]] && zle up-history
  [[ "$BUFFER" == sudo\ * ]] && LBUFFER="${LBUFFER#sudo }" || LBUFFER="sudo $LBUFFER"
}
function fuck-command-line() {
  local FUCK="$(THEFUCK_REQUIRE_CONFIRMATION=0 thefuck $(fc -ln -1 | tail -n 1) 2> /dev/null)"
  [[ -z "$FUCK" ]] && echo -n -e "\a" && return
  BUFFER="$FUCK"
  zle end-of-line
}
function suggest-accept-return(){
  zle vi-end-of-line
  zle accept-line
}
zle -N cdParentKey
zle -N cdUndoKey
zle -N cdRedoKey
zle -N fpp_pipe
zle -N sudo-command-line
zle -N fuck-command-line
zle -N suggest-accept-return
# eval "$(thefuck --alias)"
alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1 | tail -n 1)) && eval $TF_CMD && print -s $TF_CMD'
function fasd-vim(){ nvim $( fasd -flR $1 | grep -v "/nvim/files/undo/%" | percol ) }
alias v='fasd-vim'
alias grep='grep --color'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g Y="| yank"
alias -g P="| fpp"
alias suspendnow="systemctl suspend"
alias czpr='cd $ZPREZD; la'
alias vim="nvim"
alias vi="nvim"
alias ex="unarchive"
alias c='cd $(ls -1AFt | grep -E "./$" | percol); la'
alias byt="byobu-tmux"
alias bytns="byobu-tmux new-session"
alias bytd="byobu-tmux detach"
alias pyls="fasd -f -i -e python3 .py$"
alias x="exit"
alias xmo="mod_key_lay"
alias cpf='copyfile'
alias cpd='copydir'
alias la='ls -AFh'
alias lla='ls -lAFh'
alias l='ls -hF'
alias ll='ls -lhF'      #long list
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
alias usbdhcp='sudo dhcpcd $(ip link | grep -oE "\<enp[0-9]s[0-9]{2}[f0-9]?[u0-9]+\>")'
alias bluectl='sudo bluetoothctl'

export KEYTIMEOUT=3
export RANGER_LOAD_DEFAULT_RC=FALSE
export TERMCMD=$(which st)
export LD_LIBRARY_PATH=/home/ant/apps/code/lib
export JAVA_HOME="/usr/lib/jvm/default-jvm"
export GOPATH="$HOME/golang"
[[ -d "$GOPATH" ]] && export PATH="$PATH:$GOPATH/bin"

function mod_key_lay(){
  setxkbmap -option shift:both_shiftlock;
  xmodmap "$ZPREZD/dotfiles/xmodm";
  numlockx on
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
  bindkey -M vicmd ":" anyframe-widget-execute-history
}
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/chpwd-recent-dirs"
[[ -f ~/.fzf.zsh ]] && mv ~/.fzf.zsh ~/.fzf/fzf.zsh
fs ~/.fzf/fzf.zsh && source ~/.fzf/fzf.zsh
export FZF_COMPLETION_TRIGGER=',,'
_fzf_compgen_path() { ag -g "" "$1" }
RPROMPT='$(nice_exit_code)'
