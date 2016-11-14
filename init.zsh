#
# Module Loader
#

# Loads Prezto modules.
function pmodload {
  local -a pmodules

  # $argv is overridden in the anonymous function.
  pmodules=("$argv[@]")

  # Load Prezto modules.
  for pmodule in "$pmodules[@]"; do
    [[ -s "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/init.zsh" ]] && source "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/init.zsh"
  done
}

#
# Prezto Initialization
#

# Source the Prezto configuration file.
[[ -s "$ZRCD/zpreztorc" ]] && source "$ZRCD/zpreztorc"

# Disable color and theme in dumb terminals.
if [[ "$TERM" == 'dumb' ]]; then
  zstyle ':prezto:*:*' color 'no'
  zstyle ':prezto:module:prompt' theme 'off'
fi

# Load Zsh modules.
zstyle -a ':prezto:load' zmodule 'zmodules'
for zmodule ("$zmodules[@]") zmodload "zsh/${(z)zmodule}"
unset zmodule{s,}

# Load Prezto modules.
zstyle -a ':prezto:load' pmodule 'pmodules'
pmodload "$pmodules[@]"
unset pmodules
