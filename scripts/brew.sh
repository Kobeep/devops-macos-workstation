#!/bin/bash

set -e

echo "INFO ==>: Installing Homebrew packages..."

if ! command -v brew >/dev/null 2>&1; then
  echo "INFO ==>: Homebrew not found. Installing..."
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
  echo "INFO ==>: Installing packages from Brewfile..."
  brew bundle --file="$BREWFILE"
else
  echo "INFO ==>: Brewfile not found at $BREWFILE"
  exit 1
fi

echo "INFO ==>: Running brew cleanup..."
brew cleanup

echo "INFO ==>: Homebrew setup complete!"
