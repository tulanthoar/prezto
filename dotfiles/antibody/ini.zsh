function antibody_zsh() {
	case "$1" in
	bundle|update)
		while read bundle; do
			source "$bundle"
		done < <( antibody $@ )
		;;
	*)
		antibody $@
		;;
	esac
}

function _antibody_zsh() {
	IFS=' ' read -A reply <<< "$(echo "bundle update list help")"
}
compctl -K _antibody_zsh antibody_zsh

