# Check for interactive bash and that we haven't already been sourced.
[ -z "$BASH_VERSION" -o -z "$PS1" -o -n "$BASH_COMPLETION" ] && return

# Check for recent enough version of bash.
bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
if [ $bmajor -gt 3 ] || [ $bmajor -eq 3 -a $bminor -ge 2 ]; then
	if [ -r /etc/bash_completion ]; then
		# Source completion code.
		. /etc/bash_completion
	elif [ -x /usr/local/bin/brew -a -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	elif [ -r /usr/local/etc/bash_completion ]; then
		# Source completion code.
		. /usr/local/etc/bash_completion
	fi
fi
unset bash bmajor bminor
