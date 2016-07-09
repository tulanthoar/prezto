_fzf_compgen_path() { ag -g "" "$1" }
# Based on https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh (MIT licensed, as of 2016-05-05).
function __fzfz() {
  local cmd=
  z -l | awk '{print \$2}'| fzf-tmux -m | while read item; do
    printf '%q ' "$item"
  done
  echo
}
function writecmd() {
  perl -e '$TIOCSTI = 0x5412; $l = <STDIN>; $lc = $ARGV[0] eq "-run" ? "\n" : ""; $l =~ s/\s*$/$lc/; map { ioctl STDOUT, $TIOCSTI, $_; } split "", $l;' -- $1
}
function fhe() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd -run
}
function fh() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd
}
# fkill - kill process
function fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}
# ALT-I - Paste the selected entry from locate output into the command line
function fzf-locate-widget() {
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
  file="$( locate "$1" | fzf-tmux --no-sort +m)" && nvim "${file}" || return 1
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
function c(){
local Q
[[ -z "$1" ]] && Q="" || Q="$1"
cd $(find . -maxdepth 2 -type d | grep -oE "/[\W^.]?\w.*$" | fzf -q "$Q"|grep -oE "[\W^.]?\w.*$") && find . -maxdepth 1 -type d | grep -oE "/[\W^.]?\w.*$"
}
zle -N fzf-locate-widget
zle -N cdParentKey
zle -N cdUndoKey
zle -N cdRedoKey
zle -N fpp_pipe
zle -N sudo-command-line
zle -N fuck-command-line
zle -N suggest-accept-return

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
