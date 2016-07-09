ANTIBODY_BINARY=$(which antibody)
function antibody_zsh() {
	case "$1" in
	bundle|update)
		while read bundle; do
			source "$bundle" 2&> /tmp/antibody-log
		done < <( $ANTIBODY_BINARY $@ )
		;;
	*)
		$ANTIBODY_BINARY $@
		;;
	esac
}

function _antibody_zsh() {
	IFS=' ' read -A reply <<< "$(echo "bundle update list help")"
}
compctl -K _antibody_zsh antibody_zsh

