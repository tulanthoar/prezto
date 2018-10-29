#
# Defines Pacman aliases.
#
# Authors:
#   Benjamin Boudreau <dreurmail@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Tips:
#   https://wiki.archlinux.org/index.php/Pacman_Tips
#

# Return if requirements are not found.

#
# Frontend
#

# Get the Pacman frontend.
local _pacman_frontend='pacman'
local _pacman_sudo='sudo pacman'

#
# Aliases
#

# Pacman.
alias pac="${_pacman_frontend}"

# Installs packages from repositories.
alias paci="${_pacman_sudo} --sync"

# Installs packages from files.
alias pacI="${_pacman_sudo} --upgrade"

# Removes packages and unneeded dependencies.
alias pacx="${_pacman_sudo} --remove"

# Removes packages, their configuration, and unneeded dependencies.
alias pacX="${_pacman_sudo} --remove --nosave --recursive"

# Displays information about a package from the repositories.
alias pacq="${_pacman_frontend} --sync --info"

# Displays information about a package from the local database.
alias pacQ="${_pacman_frontend} --query --info"

# Searches for packages in the repositories.
alias pacs="${_pacman_frontend} --sync --search"

# Searches for packages in the local database.
alias pacS="${_pacman_frontend} --query --search"

# Lists orphan packages.
alias pacman-list-orphans="${_pacman_sudo} --query --deps --unrequired"

# Removes orphan packages.
alias pacman-remove-orphans="${_pacman_sudo} --remove --recursive \$(${_pacman_frontend} --quiet --query --deps --unrequired)"

# Synchronizes the local package and Arch Build System databases against the
# repositories.
alias pacu="${_pacman_sudo} --sync --refresh"
local cmnd=abs
[[ ${${cmnd}:c} = ${cmnd} ]] || alias pacu="${_pacman_sudo} --sync --refresh && sudo abs"

# Synchronizes the local package database against the repositories then
# upgrades outdated packages.
alias pacU="${_pacman_sudo} --noconfirm --sync --refresh --sysupgrade"
