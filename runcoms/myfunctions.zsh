autoload -U colors unarchive _fzf_compgen_path writecmd fhe f fss fp fk fzf-locate-widget u md cm v z j p n copyfile sudo-command-line c J nice_exit_code snippet-expand paste-primary
autoload -Uz add-zsh-hook tagthis taghere promptinit black red green yellow blue magenta cyan white alias-tips-preexec gencomp 256-color-test color16_load mountmmc1p1
function fasd_preexec() { { eval "fasd --proc $(fasd --sanitize $1)"; } &> /dev/null }
colors
promptinit
prompt "paradox"
add-zsh-hook preexec fasd_preexec
add-zsh-hook preexec alias-tips-preexec

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

function key_bind() {
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
  # bindkey -rM viins "^C"
  bindkey -rM viins "^X"
  bindkey -rpM viins "^X"
  bindkey -rM viins "^H"
  bindkey -rM viins "^J"
  bindkey -rM viins "^K"
  bindkey -rM viins "^L"
  bindkey -rM viins "^V"
  # bindkey -rM viins "^Y"
  # bindkey -rM viins "^T"
  bindkey -M viins "^[i" fzf-locate-widget
  bindkey -M viins "^[p" p
  bindkey -M viins "^[n" n
  bindkey -M viins "^[h" h
  bindkey -M viins "^[s" sudo-command-line
  bindkey -M viins "^E" vi-forward-char
  bindkey -M viins "^S" vi-backward-char
  bindkey -M viins "^H" vi-backward-delete-char
  bindkey -M viins "^K" vi-delete-char
  bindkey -M viins "^U" vi-forward-word
  bindkey -M viins "^D" vi-backward-word
  bindkey -M viins "^B" vi-beginning-of-line
  bindkey -M viins "^F" vi-end-of-line
  bindkey -M viins "\C-W" vi-backward-kill-word
  bindkey -M viins "\C-N" down-line-or-history
  bindkey -M viins "\C-P" up-line-or-history
  bindkey -M viins "^Z" undo
  bindkey -M viins "^R" redo
  bindkey -M viins "^@" snippet-expand
  bindkey -M viins "^J" autosuggest-execute
  bindkey -M viins "^M" accept-line
  bindkey -M viins "\e" vi-cmd-mode
  bindkey -M viins "^A" autosuggest-accept
  bindkey -M viins "\C-Q" vi-kill-line
  bindkey -M viins "\C-G" vi-kill-eol
  bindkey -M viins "\C-V" paste-primary
  bindkey -M viins "\C-O" vi-put-after
  bindkey -M viins "\C-L" vi-put-before
  bindkey -M viins "\C-X" kill-word
  bindkey -M viins "^[[3~" vi-delete-char
}
