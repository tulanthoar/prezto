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
# local -a tempor
# tempor=($(echo $1))
  local -a pmodules
  local pmodule
  local pfunction_glob='^([_.]*|prompt_*_setup|README*)(-.N:t)'

  # $argv is overridden in the anonymous function.
  # pmodules=("$argv[@]")
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
# python -c "import time, datetime;then=datetime.datetime.now()+datetime.timedelta(days=3); print(time.mktime(then.timetuple())*1e3+then.microsecond/1e3)"
# printf '%s\n' "${tempor[@]}"
  # Load Prezto modules.
  for pmodule in "$pmodules[@]"; do
    # if zstyle -t ":prezto:module:$pmodule" loaded 'yes' 'no'; then
      # continue
    # elif [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule" ]]; then
      # print "$0: no such module: $pmodule" >&2
      # continue
    # else
      if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/init.zsh" ]]; then
        source "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/init.zsh"
  # setopt CLOBBER
        # antibody_zsh bundle <<< "${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule"
      fi

      # if (( $? == 0 )); then
      #   zstyle ":prezto:module:$pmodule" loaded 'yes'
      #   echo "${pmodule} loaded"
      # else
      #   # Remove the $fpath entry.
      #   fpath[(r)${ZDOTDIR:-$HOME}/.zprezto/modules/${pmodule}/functions]=()

        # function {
        #   local pfunction

        #   # Extended globbing is needed for listing autoloadable function
        #   # directories.
        #   setopt LOCAL_OPTIONS EXTENDED_GLOB

        #   # Unload Prezto functions.
        #   for pfunction in ${ZDOTDIR:-$HOME}/.zprezto/modules/$pmodule/functions/$~pfunction_glob; do
        #     unfunction "$pfunction"
        #   done
        # }

        # zstyle ":prezto:module:$pmodule" loaded 'no'
      # fi
    # fi
  done
# python -c "import time, datetime;then=datetime.datetime.now()+datetime.timedelta(days=3); print(time.mktime(then.timetuple())*1e3+then.microsecond/1e3)"
}

#
# Prezto Initialization
#
#
# Source the Prezto configuration file.
#python -c "import time, datetime;then=datetime.datetime.now()+datetime.timedelta(days=3); print(time.mktime(then.timetuple())*1e3+then.microsecond/1e3)"
if [[ -s "${ZDOTDIR:-$HOME}/.zpreztorc" ]]; then
  source "${ZDOTDIR:-$HOME}/.zpreztorc"
fi
#python -c "import time, datetime;then=datetime.datetime.now()+datetime.timedelta(days=3); print(time.mktime(then.timetuple())*1e3+then.microsecond/1e3)"
# Disable color and theme in dumb terminals.
if [[ "$TERM" == 'dumb' ]]; then
  zstyle ':prezto:*:*' color 'no'
  zstyle ':prezto:module:prompt' theme 'off'
fi
#python -c "import time, datetime;then=datetime.datetime.now()+datetime.timedelta(days=3); print(time.mktime(then.timetuple())*1e3+then.microsecond/1e3)"
# Load Zsh modules.
zstyle -a ':prezto:load' zmodule 'zmodules'
for zmodule ("$zmodules[@]") zmodload "zsh/${(z)zmodule}"
unset zmodule{s,}
#python -c "import time, datetime;then=datetime.datetime.now()+datetime.timedelta(days=3); print(time.mktime(then.timetuple())*1e3+then.microsecond/1e3)"
# Autoload Zsh functions.
zstyle -a ':prezto:load' zfunction 'zfunctions'
for zfunction ("$zfunctions[@]") autoload -Uz "$zfunction"
unset zfunction{s,}
# python -c "import time, datetime;then=datetime.datetime.now()+datetime.timedelta(days=3); print(time.mktime(then.timetuple())*1e3+then.microsecond/1e3)"
# python -c "import time, datetime;then=datetime.datetime.now()+datetime.timedelta(days=3); print(time.mktime(then.timetuple())*1e3+then.microsecond/1e3)"
# Load Prezto modules.
zstyle -a ':prezto:load' pmodule 'pmodules'
# pmodload "$pmodules[@]"
# echo "start pmload"
pmodload "$pmodules"
# echo "end pmload"
unset pmodules
# python -c "import time, datetime;then=datetime.datetime.now()+datetime.timedelta(days=3); print(time.mktime(then.timetuple())*1e3+then.microsecond/1e3)"
