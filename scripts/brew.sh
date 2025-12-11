#!/bin/bash

set -e

echo "Installing Homebrew packages..."

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ $(uname -m) == "arm64" ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="$SCRIPT_DIR/../Brewfile"

if [ -f "$BREWFILE" ]; then
  echo "Installing packages from Brewfile..."
  brew bundle --file="$BREWFILE"
else
  echo "Brewfile not found at $BREWFILE"
  exit 1
fi

echo "Running brew cleanup..."
brew cleanup

echo "Homebrew setup complete!"
