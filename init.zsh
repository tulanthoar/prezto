#
# Initializes Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Version Check
#

# Check for the minimum supported version.
min_zsh_version='4.3.17'
if ! autoload -Uz is-at-least || ! is-at-least "$min_zsh_version"; then
  print "prezto: old shell detected, minimum required: $min_zsh_version" >&2
  return 1
fi
unset min_zsh_version

#
# Module Loader
#

# Loads Prezto modules.
function pmodload {
  local -a pmodules
  local pmodule
  local pfunction_glob='^([_.]*|prompt_*_setup|README*)(-.N:t)'

  pmodules=($(echo $1))

  # Add functions to $fpath.
  fpath=(${pmodules:+${ZDOTDIR:-$HOME}/.zprezto/modules/${^pmodules}/functions(/FN)} $fpath)

  function {
    local pfunction

    # Extended globbing is needed for listing autoloadable function directories.
    setopt LOCAL_OPTIONS EXTENDED_GLOB

    # Load Prezto functions.
    for pfunction in ${ZDOTDIR:-$HOME}/.zprezto/modules/${^pmodules}/functions/$~pfunction_glob; do
      autoload -Uz "$pfunction"
    done
  }
  # Load Prezto modules.
  for pmodule in "$pmodules[@]"; do
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/init.zsh" ]]; then
      source "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/init.zsh"
    fi

    function {
      local pfunction

      # Extended globbing is needed for listing autoloadable function
      # directories.
      setopt LOCAL_OPTIONS EXTENDED_GLOB

      # Unload Prezto functions.
      for pfunction in ${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/functions/$~pfunction_glob; do
        unfunction "$pfunction"
      done
    }
  done
}

#
# Prezto Initialization
#
#
# Source the Prezto configuration file.
if [[ -s "${ZDOTDIR:-$HOME}/.zpreztorc" ]]; then
  source "${ZDOTDIR:-$HOME}/.zpreztorc"
fi
# Disable color and theme in dumb terminals.
if [[ "$TERM" == 'dumb' ]]; then
  zstyle ':prezto:*:*' color 'no'
  zstyle ':prezto:module:prompt' theme 'off'
fi
# Load Zsh modules.
zstyle -a ':prezto:load' zmodule 'zmodules'
for zmodule ("$zmodules[@]") zmodload "zsh/${(z)zmodule}"
unset zmodule{s,}
zstyle -a ':prezto:load' zfunction 'zfunctions'
for zfunction ("$zfunctions[@]") autoload -Uz "$zfunction"
unset zfunction{s,}
# Load Prezto modules.
zstyle -a ':prezto:load' pmodule 'pmodules'
pmodload "$pmodules"
unset pmodules
