insert-cycledleft () {
  emulate -L zsh
  setopt nopushdminus
  builtin pushd -q +1 &>/dev/null || true
  zle reset-prompt
}
insert-cycledright () {
  emulate -L zsh
  setopt nopushdminus
  builtin pushd -q -0 &>/dev/null || true
  zle reset-prompt
}
function percol_select_history() {
    local tac
    tac="tac"
    BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
    CURSOR=$#BUFFER         # move cursor
    zle -R -c               # refresh
}
function fpp_pipe() {
  eval '`echo "$BUFFER"`|fpp'
  BUFFER=''
  zle -R -c               # refresh
}
function copydir {
  emulate -L zsh
  print -n $PWD | clipcopy
}
function copyfile {
  emulate -L zsh
  clipcopy $1
}
sudo-command-line() {
  [[ -z $BUFFER ]] && zle up-history
  [[ $BUFFER == sudo\ * ]] && LBUFFER="${LBUFFER#sudo }" || LBUFFER="sudo $LBUFFER"
}
function p-paste() {
    OLDC=CURSOR
    RBUFFER="`python3 $HOME/pyproj/tldr/ppaste.py`${RBUFFER}"
    CURSOR=$CURSOR
    zle -R -c
}
if [[ -z $commands[thefuck] ]]; then
  echo 'no fuck installed';
  which pip > /dev/null || alias installthefuck="sudo pacman -S python-pip && sudo pip install thefuck"
  which pip > /dev/null && alias installthefuck="sudo pip install thefuck"
  echo 'alias added installthefuck'
else;
  eval "$(thefuck --alias)"
  fuck-command-line() {
    local FUCK="$(THEFUCK_REQUIRE_CONFIRMATION=0 thefuck $(fc -ln -1 | tail -n 1) 2> /dev/null)"
    [[ -z $FUCK ]] && echo -n -e "\a" && return
    BUFFER=$FUCK
    zle end-of-line
  }
  zle -N fuck-command-line
fi
suggest-accept-return(){
  zle vi-end-of-line
  $HOME/pyproj/tldr/press_return.py
}
zle -N insert-cycledleft
zle -N insert-cycledright
zle -N suggest-accept-return
zle -N fpp_pipe
zle -N percol_select_history
zle -N p-paste
zle -N sudo-command-line

# alias grep='grep --color'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias suspendnow="sudo pm-suspend"
alias -g Y="| yank"
alias -g YL="| yank -l"
alias V="fasd -f -i -e nvim"
alias EX="unarchive"
alias C="cd $HOME"
alias BT="byobu-tmux"
alias pyls="fasd -f -i -e python3 .py$"
alias X="exit"
alias xmo="xmodmap ~/xmo; setxkbmap -option altwin:alt_super_win -option shift:both_shiftlock; xmodmap ~/xmo; numlockx"
alias cpf='copyfile'
alias cpd='copydir'
alias L='ls -lFh'     #size,show type,human readable
alias LA='ls -lAFh'   #long list,show almost all,show type,human readable
alias LL='ls -l'      #long list
alias LH='ls -ld .*'
alias FD='fasd -d -i'
alias FF='fasd -f -i'
alias FA='fasd -a -i'
alias help='man'
alias unexport='unset'
alias whereami=display_info
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
# alias pycharm="cd $HOME/apps/pycharm/bin && ./pycharm.sh"

export GHUB="https://github.com"
export TUL="tulanthoar"
export JAVA_HOME="/usr/lib/jvm/default-jvm"
export GOPATH="$HOME/golang"
[[ -d "$GOPATH" ]] && export PATH="$PATH:$GOPATH/bin"

function BKEYS() {
  bindkey -M viins "^Z" vi-cmd-mode
  bindkey -M viins "^[ " suggest-accept-return
  bindkey -M viins "^@" vi-forward-word
  bindkey -M viins "^[d" insert-cycledright
  bindkey -M viins "^[u" insert-cycledleft
  bindkey -M viins "^[c" yank_pipe
  bindkey -M viins "^[p" fpp_pipe
  bindkey -M viins "^[h" anyframe-widget-execute-history
  bindkey -M viins "^[s" anyframe-widget-insert-filename
  bindkey -M viins "^[q" anyframe-widget-kill
  bindkey -M viins "^[v" p-paste
  bindkey -M viins "^[f" forward-word
  bindkey -M viins "^[b" backward-word
  bindkey -M viins "^B" insert-cycledleft
  bindkey -M viins "^F" insert-cycledright
  bindkey -rM viins "^[";
  bindkey -M viins "\e" vi-cmd-mode;
  bindkey -M viins "^[[3~" vi-delete-char;
  bindkey -M vicmd "\e" sudo-command-line
  bindkey -M vicmd "\t" fuck-command-line
  bindkey -M vicmd ":" percol_select_history
}
