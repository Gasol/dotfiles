#!/bin/sh

BREW=${BREW-$(which brew)}

echo "install caskroom/cask/brew-cask"

$BREW cask ls | xargs -n 1 echo cask install
