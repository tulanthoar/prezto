# fasd_cd() {
#   if [ $# -le 1 ]; then
#     fasd "$@"
#   else
#     local _fasd_ret="$(fasd -e 'printf %s' "$@")"
#     [ -z "$_fasd_ret" ] && return
#     [ -d "$_fasd_ret" ] && cd "$_fasd_ret" || printf %s\n "$_fasd_ret"
#   fi
# }
# alias z='fasd_cd -d'
# alias zz='fasd_cd -d -i'

# add zsh hook
# _fasd_preexec() {
#   { eval "fasd --proc $(fasd --sanitize $1)"; } >> "/dev/null" 2>&1
# }
# autoload -Uz add-zsh-hook
add-zsh-hook preexec _fasd_preexec

# zsh command mode completion
# _fasd_zsh_cmd_complete() {
#   local compl
#   read -c compl
#   (( $+compstate )) && compstate[insert]=menu # no expand if compsys loaded
#   reply=(${(f)"$(fasd --complete "$compl")"})
# }

# enbale command mode completion
compctl -U -K _fasd_zsh_cmd_complete -V fasd -x 'C[-1,-*e],s[-]n[1,e]' -c - \
    'c[-1,-A][-1,-D]' -f -- fasd fasd_cd

zle -C fasd-complete complete-word _generic
zstyle ':completion:fasd-complete:*' completer _fasd_zsh_word_complete
zstyle ':completion:fasd-complete:*' menu-select

zle -C fasd-complete-f complete-word _generic
zstyle ':completion:fasd-complete-f:*' completer _fasd_zsh_word_complete_f
zstyle ':completion:fasd-complete-f:*' menu-select

zle -C fasd-complete-d complete-word _generic
zstyle ':completion:fasd-complete-d:*' completer _fasd_zsh_word_complete_d
zstyle ':completion:fasd-complete-d:*' menu-select

# enable word mode completion
local orig_comp="$(zstyle -L ':completion:\*' completer 2>> "/dev/null")"
if [ "$orig_comp" ]; then
    case $orig_comp in
        *_fasd_zsh_word_complete_trigger*);;
        *) eval "$orig_comp _fasd_zsh_word_complete_trigger";;
    esac
else
    zstyle ':completion:*' completer _complete _fasd_zsh_word_complete_trigger
fi
