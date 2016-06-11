autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/chpwd-recent-dirs"
_fzf_compgen_path() { ag -g "" "$1" }
# Based on https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh (MIT licensed, as of 2016-05-05).
function __fzfz() {
  local cmd=
  z -l | awk '{print \$2}'| fzf-tmux -m | while read item; do
    printf '%q ' "$item"
  done
  echo
}
writecmd() {
  perl -e '$TIOCSTI = 0x5412; $l = <STDIN>; $lc = $ARGV[0] eq "-run" ? "\n" : ""; $l =~ s/\s*$/$lc/; map { ioctl STDOUT, $TIOCSTI, $_; } split "", $l;' -- $1
}
fhe() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd -run
}
fh() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd
}
# fkill - kill process
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}') 
  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}
# ALT-I - Paste the selected entry from locate output into the command line
fzf-locate-widget() {
if [[ $- =~ i ]]; then
  local selected
  if selected=$(locate / | fzf -q "$LBUFFER"); then
    LBUFFER=$selected
  fi
  zle redisplay
fi
}
# cdf - cd into the directory of the selected file
function cdf() {
   local file
   local dir
   file=$(fzf-tmux +m -q "$1") && dir=${file:h} && cd "$dir"
 }
# fss [FUZZY PATTERN] - Select selected tmux session
function fss() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1")
  tmux switch-client -t "$session"
}
function fsa() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1")
  tmux switch-client -t "$session"
}
# ftpane - switch pane (@george-b)
function ftpane() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf-tmux +m --reverse) || return

  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}
function V() {
  local file
  file="$(fasd -Rfl "$1" | fzf-tmux --no-sort +m)" && nvim "${file}" || return 1
}
function z() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf-tmux --no-sort +m)" && cd "${dir}" || return 1
}
function fzfz-file-widget() {
  LBUFFER="${LBUFFER}$(__fzfz)"
  zle redisplay
}
# zle     -N   fzfz-file-widget
# bindkey '^G' fzfz-file-widget
function fe() {
  IFS='
'
  local declare files=($(fzf-tmux --query="$1"))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
  unset IFS
}
# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
function cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf-tmux --read0)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}
# fda - including hidden directories
function fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf-tmux +m) && cd "$dir"
}
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
zle     -N    fzf-locate-widget
zle -N cdParentKey
zle -N cdUndoKey
zle -N cdRedoKey
zle -N fpp_pipe
zle -N sudo-command-line
zle -N fuck-command-line
zle -N suggest-accept-return
alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1 | tail -n 1)) && eval $TF_CMD && print -s $TF_CMD'
alias grep='grep --color'
alias fzf='fzf-tmux'
alias xmo="mod_key_lay"
alias cpf='copyfile'
alias cpd='copydir'
alias la='ls -AFh'
alias lla='ls -lAFh'
alias l='ls -hF'
alias ll='ls -lhF'      #long list
alias lh='ls -lhF .*'
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
alias blueconnect='dbus-send --system --type=method_call --dest=org.bluez /org/bluez/hci0/dev_1C_B7_2C_53_28_DA org.bluez.Network1.Connect string:"nap"'
alias gparted='sudo gparted'
alias usbdhcp='sudo dhcpcd $(ip link | grep -oE "\<enp[0-9]s[0-9]{2}[f0-9]?[u0-9]+\>")'
alias bluectl='sudo bluetoothctl'
# alias -g H='| head'
# alias -g T='| tail'
# alias -g G='| grep'
# alias -g L="| less"
# alias -g Y="| yank"
# alias -g P="| fpp"
# alias suspendnow="systemctl suspend"
# alias czpr='cd $ZPREZD; la'
# alias vim="nvim"
# alias vi="nvim"
# alias ex="unarchive"
# alias c='cd $(ls -1AFt | grep -E "./$" | percol); la'
# alias byt="byobu-tmux"
# alias bytns="byobu-tmux new-session"
# alias bytd="byobu-tmux detach"
# alias pyls="fasd -f -i -e python3 .py$"
# alias x="exit"
# alias fd='fasd -d -i'
# alias ff='fasd -f -i'
# alias fa='fasd -a -i'

export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_OPTS="--select-1 --exit-0 --inline-info --color fg:102,bg:233,hl:65,fg+:15,bg+:234,hl+:108,info:108,prompt:109,spinner:108,pointer:168,marker:168"
RPROMPT='$(nice_exit_code)'
export KEYTIMEOUT=3
export RANGER_LOAD_DEFAULT_RC=FALSE
export TERMCMD=$(which st)
export LD_LIBRARY_PATH=/home/ant/apps/code/lib
export JAVA_HOME="/usr/lib/jvm/default-jvm"
export GOPATH="$HOME/golang"
[[ -d "$GOPATH" ]] && export PATH="$PATH:$GOPATH/bin"

function mod_key_lay(){
  setxkbmap -option shift:both_shiftlock;
  xmodmap "${ZPDOTD}/xmodm";
  numlockx on
}
function bind_keys() {
  bindkey -M viins "^@" snippet-expand
  bindkey -M viins "^Z" vi-cmd-mode
  bindkey -M viins "^A" beginning-of-line
  bindkey -M viins "^[ " suggest-accept-return
  bindkey -M viins "^[d" insert-cycledright
  bindkey -M viins "^[u" insert-cycledleft
  bindkey -M viins "^[p" fpp_pipe
  bindkey -M viins "^[v" c-paste
  bindkey -M viins "^[w" forward-word
  bindkey -M viins "^[b" backward-word
  bindkey -M viins "^B" cdUndoKey
  bindkey -M viins "^F" cdRedoKey
  bindkey -M viins "^P" cdParentKey
  bindkey -rM viins "^[";
  bindkey -M viins "\e" vi-cmd-mode;
  bindkey -M viins "^[[3~" vi-delete-char;
  bindkey -M vicmd "\e" sudo-command-line
  bindkey -M vicmd "\t" fuck-command-line
}
