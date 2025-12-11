#!/bin/bash

set -e

echo "INFO ==>: Configuring macOS system preferences..."
echo "INFO ==>: Note: Some changes require logout/restart to take effect"
echo ""

read -p "Apply macOS system preferences? (y/n):" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "INFO ==>: Skipped macOS preferences"
  exit 0
fi

echo "INFO ==>: Configuring Dock..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock minimize-to-application -bool true

echo "INFO ==>: Configuring Finder..."
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "INFO ==>: Configuring Screenshots..."
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true
mkdir -p "${HOME}/Pictures/Screenshots"

echo "INFO ==>: Configuring Keyboard..."
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "INFO ==>: Configuring Trackpad..."
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "INFO ==>: Configuring Energy settings..."
sudo pmset -a displaysleep 10
sudo pmset -a sleep 0

echo ""
echo "INFO ==>: Restarting affected applications..."
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true

echo ""
echo "INFO ==>: macOS preferences configured!"
echo "INFO ==>: Some changes may require logout or restart"
