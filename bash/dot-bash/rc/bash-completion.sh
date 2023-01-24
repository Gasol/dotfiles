# Check for interactive bash and that we haven't already been sourced.
[ -z "$BASH_VERSION" -o -z "$PS1" -o -n "$BASH_COMPLETION" ] && return

# Check for recent enough version of bash.
bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
if [ $bmajor -gt 3 ] || [ $bmajor -eq 3 -a $bminor -ge 2 ]; then
	if [ -r /etc/bash_completion ]; then
		# Source completion code.
		. /etc/bash_completion
	fi
	if [ -r /usr/local/etc/bash_completion ]; then
		# Source completion code.
		. /usr/local/etc/bash_completion
	fi
	if command -v brew >/dev/null; then
		HOMEBREW_PREFIX=$(brew --prefix)
		if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
			source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
		else
			for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
				[[ -r "$COMPLETION" ]] && source "$COMPLETION"
			done
		fi
	fi
fi
unset bash bmajor bminor
