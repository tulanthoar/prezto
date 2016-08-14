_fasd_preexec() { { eval "fasd --proc $(fasd --sanitize $1)"; } &> /dev/null }
autoload -Uz add-zsh-hook
add-zsh-hook preexec _fasd_preexec
_fzf_compgen_path() { ag -i --hidden -g "" "$1" }
# Based on https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh (MIT licensed, as of 2016-05-05).
function writecmd() { perl -e '$TIOCSTI = 0x5412; $l = <STDIN>; $lc = $ARGV[0] eq "-run" ? "\r" : ""; $l =~ s/\s*$/$lc/; map { ioctl STDOUT, $TIOCSTI, $_; } split "", $l;' -- $1 }
alias fhe='fc -nl 1 | fzf --no-sort --tac | writecmd -run'
alias h='fc -nl 1 | fzf --no-sort --tac | writecmd'
# fss [FUZZY PATTERN] - Select selected tmux session
function fss() { tmux switch-client -t $(tmux list-sessions -F "#{session_name}"|fzf --query="$1") }
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
function v() { nvim $(fasd -Rfl $1 | fzf-tmux --no-sort +m) }
function z() { \cd $(fasd -Rdl $1 | fzf-tmux --no-sort +m) }
function j() {
  local file
  file=$(ag -i --hidden -g "" / 2&>/dev/null | fzf +s --query=$1)
  [[ -d ${file:h} ]] && \cd ${file:h}
}
function p() {
  pushd -q +1 > /dev/null
  if [[ $# -ne 0 ]]; then
    value=$1
    (( value-- ))
    [[ $value -gt 0 ]] && eval "p $value"
    unset value
  fi
}
function n() {
  pushd -q -0 > /dev/null
  if [[ $# -ne 0 ]]; then
    value=$1
    (( value-- ))
    [[ $value -gt 0 ]] && eval "n $value"
    unset value
  fi
}
function copyfile { xsel -i <$1 &> /dev/null }
function sudo-command-line() {
  [[ -z $BUFFER ]] && zle up-history
  [[ $BUFFER == sudo\ * ]] && LBUFFER=${LBUFFER#sudo } || LBUFFER="sudo $LBUFFER"
}
function suggest-accept-return(){
  zle vi-end-of-line
  zle accept-line
}
function c(){
  \cd $(find . -maxdepth 2 -type d | grep -oE "/[\W^.]?\w.*$" |cut -c2-| fzf -q $1)
  find . -maxdepth 1 -type d | grep -oE "/[\W^.]?\w.*$" |cut -c2-|perl -p -e 's/(.)$/$1\//g'|white
}

function jump(){ \cd $(fzf --query=$1 < $FZFBMARKS|cut -c2-) }
function damrk(){ cat $FZFBMARKS | grep -vx $(fzf --query=$1 < $FZFBMARKS) > $FZFBMARKS }
function mark() { echo $1 : $(pwd) >> $FZFBMARKS }

typeset -Ag snippets
snippet-add() { snippets[$1]=$2 }

snippet-expand() {
    emulate -L zsh
    setopt extendedglob
    local MATCH

    LBUFFER=${LBUFFER%%(#m)[.\-+:|_a-zA-Z0-9]#}
    LBUFFER+=${snippets[$MATCH]:-$MATCH}
}
zle -N snippet-expand
zle -N fzf-locate-widget
zle -N p
zle -N n
zle -N sudo-command-line
zle -N suggest-accept-return

function bind_keys() {
  bindkey -M viins "^[i" fzf-locate-widget
  bindkey -M viins "^[p" p
  bindkey -M viins "^[n" n
  bindkey -M viins "^[ " suggest-accept-return
  bindkey -M viins "^[s" sudo-command-line
  bindkey -M viins "^@" snippet-expand
  bindkey -M viins "^Z" vi-cmd-mode
  bindkey -M viins "^A" vi-cmd-mode
  bindkey -M viins "^B" backward-word
  bindkey -rM viins "^Y"
  bindkey -M viins "^Yb" vi-backward-kill-word
  bindkey -M viins "^Ye" kill-word
  bindkey -M viins "^Ys" kill-whole-line
  bindkey -M viins "^\\" vi-end-of-line
  bindkey -M viins "^_" beginning-of-line
  bindkey -M viins "^U" undo
  bindkey -M viins "^R" redo
  bindkey -M viins "^F" vi-find-prev-char
  bindkey -M viins "^S" vi-kill-eol
  bindkey -rM viins "^["
  bindkey -rM viins "^D"
  bindkey -rM viins "^G"
  bindkey -rM viins "^H"
  bindkey -rM viins "^J"
  bindkey -rM viins "^K"
  bindkey -rM viins "^L"
  bindkey -M viins "^[[3~" vi-delete-char;
}
