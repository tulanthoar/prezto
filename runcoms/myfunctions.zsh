autoload -U unarchive _fzf_compgen_path writecmd fhe f fss fp fk fzf-locate-widget u md cm v z j p n copyfile sudo-command-line c J nice_exit_code snippet-expand

function _fasd_preexec() { { eval "fasd --proc $(fasd --sanitize $1)"; } &> /dev/null }
autoload -Uz add-zsh-hook && add-zsh-hook preexec _fasd_preexec

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

function bind_keys() {
  zle -N snippet-expand
  zle -N fzf-locate-widget
  zle -N h
  zle -N p
  zle -N n
  zle -N sudo-command-line
  bindkey -v
  bindkey -rM viins "^["
  bindkey -rM viins "^D"
  bindkey -rM viins "^G"
  bindkey -rM viins "^H"
  bindkey -rM viins "^J"
  bindkey -rM viins "^K"
  bindkey -rM viins "^L"
  bindkey -rM viins "^Y"
  bindkey -M viins "^[w" vi-forward-word
  bindkey -M viins "^[i" fzf-locate-widget
  bindkey -M viins "^[p" p
  bindkey -M viins "^[n" n
  bindkey -M viins "^[h" h
  bindkey -M viins "^[ " autosuggest-execute
  bindkey -M viins "^[s" sudo-command-line
  bindkey -M viins "^@" snippet-expand
  bindkey -M viins "^Z" vi-cmd-mode
  bindkey -M viins "^A" vi-cmd-mode
  bindkey -M viins "^E" vi-forward-blank-word
  bindkey -M viins "^B" backward-word
  bindkey -M viins "^Yb" vi-backward-kill-word
  bindkey -M viins "^Ye" kill-word
  bindkey -M viins "^Ys" kill-whole-line
  bindkey -M viins "^\\" vi-end-of-line
  bindkey -M viins "^_" beginning-of-line
  bindkey -M viins "^U" undo
  bindkey -M viins "^R" redo
  bindkey -M viins "^F" vi-find-prev-char
  bindkey -M viins "^S" vi-kill-eol
  bindkey -M viins "^[[3~" vi-delete-char;
}
