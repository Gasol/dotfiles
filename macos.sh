#!/bin/sh

USERNAME=gasolwu

defaults write com.apple.screencapture location "/Users/$USERNAME/Desktop/Screenshots"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false
