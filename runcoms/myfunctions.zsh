_fzf_compgen_path() { ag -i --hidden -g "" "$1" }
# Based on https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh (MIT licensed, as of 2016-05-05).
function writecmd() {
  perl -e '$TIOCSTI = 0x5412; $l = <STDIN>; $lc = $ARGV[0] eq "-run" ? "\n" : ""; $l =~ s/\s*$/$lc/; map { ioctl STDOUT, $TIOCSTI, $_; } split "", $l;' -- $1
}
alias fhe='fc -nl 1 | fzf --no-sort --tac | writecmd -run'
alias h='fc -nl 1 | fzf --no-sort --tac | writecmd'
# fss [FUZZY PATTERN] - Select selected tmux session
function fss() {
  tmux switch-client -t $(tmux list-sessions -F "#{session_name}"|fzf --query="$1")
}
# ftpane - switch pane (@george-b)
function fp() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')
  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return
  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)
  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}
function fk() {
  pid=$(ps -ef | sed 1d | fzf -m --query="^$USER " | awk '{print $2}')
  [[ "x$pid" != "x" ]] && kill -${1:-9} $pid
}
function fzf-locate-widget() {
  local selected
  if selected=$(locate -0 / | fzf --read0); then
    LBUFFER="$LBUFFER $selected"
  fi
  zle redisplay
}
function v() {
  nvim "$(fasd -Rfl "$1" | fzf-tmux --no-sort +m)"
}
function z() {
  \cd "$(fasd -Rdl "$1" | fzf-tmux --no-sort +m)"
}
function j() {
  local file
  file=$(ag -i --hidden -g "" / 2&>/dev/null | fzf --query="$1")
  [[ -d ${file:h} ]] && \cd ${file:h}
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
  \cd $(find . -maxdepth 2 -type d | grep -oE "/[\W^.]?\w.*$" | fzf -q "$1"|grep -oE "[\W^.]?\w.*$") && find . -maxdepth 1 -type d | grep -oE "/[\W^.]?\w.*$"
}
zle -N fzf-locate-widget
zle -N cdUndoKey
zle -N cdRedoKey
zle -N sudo-command-line
zle -N fuck-command-line
zle -N suggest-accept-return

function bind_keys() {
  bindkey -M viins "^@" snippet-expand
  bindkey -M viins "^Z" vi-cmd-mode
  bindkey -M viins "^A" beginning-of-line
  bindkey -M viins "^[ " suggest-accept-return
  bindkey -M viins "^B" backward-word
  bindkey -M viins "^[i" fzf-locate-widget
  bindkey -M viins "^P" cdUndoKey
  bindkey -M viins "^N" cdRedoKey
  bindkey -rM viins "^[";
  bindkey -rM viins "^D"
  bindkey -rM viins "^G"
  bindkey -rM viins "^H"
  bindkey -rM viins "^J"
  bindkey -rM viins "^K"
  bindkey -rM viins "^L"
  bindkey -M viins "^[[3~" vi-delete-char;
  bindkey -M viins "\e" sudo-command-line
  bindkey -M vicmd "\t" fuck-command-line
}
