autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/chpwd-recent-dirs"
source "${ZPDOTD}/myfunctions.zsh"
source "${ZPDOTD}/myaliases.zsh"
source "${ZPDOTD}/mysnippets.zsh"
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
