#!/bin/sh

BREW=${BREW-$(which brew)}

$BREW leaves | xargs brew info | grep From | awk -F '/' 'BEGIN{ OFS=""} $5 != "homebrew" {print "tap ",tolower($4),"/",tolower($5)}'
$BREW leaves | xargs -n 1 echo install
