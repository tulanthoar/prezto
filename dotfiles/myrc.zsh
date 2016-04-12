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
  if [[ $BUFFER == sudo\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
  else
    LBUFFER="sudo $LBUFFER"
  fi
}
function p-paste() {
    OLDC=CURSOR
    RBUFFER="`python3 ~/PycharmProjects/tldr/ppaste.py`${RBUFFER}"
    CURSOR=$CURSOR
    zle -R -c
}
if [[ -z $commands[thefuck] ]]; then
  echo 'no fuck installed';
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
zle -N fpp_pipe
zle -N p-paste
zle -N sudo-command-line

alias Y="| yank"
alias YL="| yank -l"
alias v="sf -e nvim"
alias x="unarchive"
alias zz="z ~"
alias bytmux="byobu-tmux"
alias pyls="ls *.py|percol|xargs python3"
alias xx="exit"
alias xmo="xmodmap ~/xmo; setxkbmap -option altwin:alt_super_win -option shift:both_shiftlock; xmodmap ~/xmo;"
alias cpf='copyfile'
alias cpd='copydir'
alias pycharm="cd $HOME/apps/pycharm/bin && ./pycharm.sh"

#make ^H work [nvim]
eval infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' | tic -
export GHUB="https://github.com"
export TUL="tulanthoar"
export JAVA_HOME="/usr/lib/jvm/default-jvm"
export GOPATH="~/golang"
export PATH="$PATH:$GOPATH/bin"

bindkey -M viins "^[ " autosuggest-accept
bindkey -M viins "^@" vi-forward-word
bindkey -M viins "^[c" yank_pipe
bindkey -M viins "^[p" fpp_pipe
bindkey -M viins "^[h" anyframe-widget-execute-history
bindkey -M viins "^[s" anyframe-widget-insert-filename
bindkey -M viins "^[q" anyframe-widget-kill
bindkey -M viins "^[v" p-paste
bindkey -M viins "^[f" forward-word
bindkey -M viins "^[b" backward-word
function BKEYS() {
  bindkey -rM viins "^[";
  bindkey -M viins "\e" vi-cmd-mode;
  bindkey -M viins "^[[3~" vi-delete-char;
  bindkey -M vicmd "\e" sudo-command-line
  bindkey -M vicmd "\t" fuck-command-line
  bindkey -M vicmd ":" percol_select_history
}

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias ll='ls -l'      #long list
alias ldots='ls -ld .*'

alias grep='grep --color'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"

alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias help='man'
alias unexport='unset'

alias whereami=display_info

alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
