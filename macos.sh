#!/bin/sh

# Screenshots go to ~/Pictures: iCloud "Desktop & Documents" syncs ~/Desktop, and screenshots can hold secrets.
screenshots="$HOME/Pictures/Screenshots"
mkdir -p "$screenshots"

defaults write com.apple.screencapture location "$screenshots"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false

# The new screenshot location takes effect after this restart.
killall SystemUIServer
