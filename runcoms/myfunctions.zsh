autoload -U l nvf colors unarchive _fzf_compgen_path writecmd fhe f fss fp fk fzf-locate-widget u md cm v j p n copyfile sudo-command-line c J nice_exit_code snippet-expand paste-primary
autoload -Uz add-zsh-hook tagthis taghere promptinit black red green yellow blue magenta cyan white alias-tips-preexec gencomp 256-color-test color16_load mountmmc1p1
function fasd_preexec() { { eval "fasd --proc $(fasd --sanitize $1)"; } &> /dev/null }
add-zsh-hook preexec fasd_preexec
eval "$(fasd --init auto)"
colors
promptinit
prompt "paradox"
add-zsh-hook preexec alias-tips-preexec

# Key bindings
# ------------
if [[ $- == *i* ]]; then

    # CTRL-T - Paste the selected file path(s) into the command line
    function __fsel() {
        local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
            -o -type f -print \
            -o -type d -print \
            -o -type l -print 2> /dev/null | sed 1d | cut -b3-"}"
        setopt localoptions pipefail 2> /dev/null
        eval "$cmd | $(__fzfcmd) -m $FZF_CTRL_T_OPTS" | /
        { while read item; do
            echo -n "${(q)item} "
        done }
        local ret=$?
        echo
        return $ret
    }

    function __fzfcmd() {
        [ ${FZF_TMUX:-1} -eq 1 ] && echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
    }

    function fzf-file-widget() {
        LBUFFER="${LBUFFER}$(__fsel)"
        local ret=$?
        zle redisplay
        typeset -f zle-line-init >/dev/null && zle zle-line-init
        return $ret
    }

    # CTRL-R - Paste the selected command from history into the command line
    function fzf-history-widget() {
        local selected num
        setopt localoptions noglobsubst pipefail 2> /dev/null
        # selected=( $(fc -l 1 | eval "$(__fzfcmd) +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r $FZF_CTRL_R_OPTS -q ${(q)LBUFFER}") )
        selected=( $(fc -ln 1 | eval "$(__fzfcmd) +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r $FZF_CTRL_R_OPTS") )
        LBUFFER="${LBUFFER}${selected}"
        local ret=$?
        # if [ -n "$selected" ]; then
        #     num=$selected[1]
        #     if [ -n "$num" ]; then
        #         zle vi-fetch-history -n $num
        #     fi
        # fi
        zle redisplay
        typeset -f zle-line-init >/dev/null && zle zle-line-init
        return $ret
    }
fi

function snippets-add() {
    typeset -Ag snippets
    snip() { snippets[$1]="$2" }
    snip wi "sudo wifi-menu"
    snip t "|tail -n10"
    snip h "|head -n10"
    snip g "|grep "
    snip l "|less "
    snip f "|fpp "
    snip add "git status | fpp"
    snip push "git commit && git push"
    snip s "startx"
}

function cdf(){
    local QUER=" "
    if [ $# -gt 0 ]; then
        QUER="${@}"
    fi
    local target_path=${$(exa -1F --color=always --color-scale $({ for d in $(fasd -ldR|head -n50); do find $d -maxdepth 2 -type f -print0 | /bin/grep -Evz '(\s|/\.cache/|^/usr/include/|^/usr/bin/|^/usr/lib/|^/usr/lib32/)'; done }) \
        | fzf --ansi --no-sort --preview-window=right:30 -q $QUER \
        --nth='-1' --delimiter='\/' \
        --preview="exa -hTaF --color=always --color-scale --group-directories-first --git-ignore --level=2 --sort=size {..-2}"):A:h}
    # local target_path=${target_path:A:h}
    [[ -d $target_path ]] && cd $target_path && zle reset-prompt&>/dev/null
}
zle -N cdf
autoload -Uz cdf

function key_bind() {
    zle     -N   fzf-history-widget
    zle -N fzf-file-widget
    zle -N accept-and-run
    zle -N snippet-expand
    zle -N fzf-locate-widget
    zle -N h
    zle -N p
    zle -N n
    zle -N sudo-command-line
    zle -N paste-primary
    bindkey -v
    bindkey -rM viins "^["
    bindkey -rM viins "^D"
    bindkey -rM viins "^G"
    bindkey -rM viins "^X"
    bindkey -rpM viins "^X"
    bindkey -rM viins "^H"
    bindkey -rM viins "^J"
    bindkey -rM viins "^K"
    bindkey -rM viins "^L"
    bindkey -rM viins "^V"
    #disable arrow keys!
    bindkey -rM viins "^[OA"
    bindkey -rM viins "^[OB"
    bindkey -rM viins "^[OC"
    bindkey -rM viins "^[OD"
    # ^Y is byobu prefix
    # bindkey -rM viins "^Y"
    # bindkey -M viins "\e" vi-cmd-mode
    # ^? is backspace
    # ^@ is C-Space
    bindkey -M viins "^?" fzf-history-widget
    bindkey -M viins "^[i" fzf-locate-widget
    bindkey -M viins "^[p" p
    bindkey -M viins "^[n" n
    bindkey -M viins "^[s" sudo-command-line
    bindkey -M viins "^\\\\" accept-and-infer-next-history
    bindkey -M viins "\C-I" fzf-completion
    bindkey -M viins "\C-E" vi-forward-char
    bindkey -M viins "\C-S" vi-backward-char
    bindkey -M viins "\C-H" vi-backward-delete-char
    bindkey -M viins "\C-K" vi-delete-char
    bindkey -M viins "\C-U" vi-forward-word
    bindkey -M viins "\C-D" vi-backward-word
    bindkey -M viins "\C-B" vi-beginning-of-line
    bindkey -M viins "\C-F" vi-end-of-line
    bindkey -M viins "\C-W" vi-backward-kill-word
    bindkey -M viins "\C-P" history-substring-search-up
    bindkey -M viins "\C-N" history-substring-search-down
    bindkey -M viins "\C-Z" undo
    bindkey -M viins "\C-R" redo
    bindkey -M viins "\C-@" accept-and-infer-next-history
    bindkey -M viins "\C-J" accept-and-infer-next-history
    bindkey -M viins "\C-M" accept-line
    bindkey -M viins "\C-Gf" cdf
    bindkey -M viins "\C-A" copy-prev-shell-word
    bindkey -M viins "\C-Q" send-break
    bindkey -M viins "\C-T" fzf-file-widget
    bindkey -M viins "\C-V" history-search-multi-word
    bindkey -M viins "\C-O" vi-put-after
    bindkey -M viins "\C-L" vi-put-before
    bindkey -M viins "\C-X" kill-word
    bindkey -M viins "^[[3~" vi-delete-char
}
