#!/bin/bash

set -e

DOTFILES_DIR="$HOME/github/devops-macos-workstation/dotfiles"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "Creating dotfiles symlinks..."

if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Error: dotfiles directory not found at $DOTFILES_DIR"
  exit 1
fi

mkdir -p "$BACKUP_DIR"
echo "Backup directory: $BACKUP_DIR"

files=(".zshrc")

for file in "${files[@]}"; do
  if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
    echo "Backing up existing $file"
    mv "$HOME/$file" "$BACKUP_DIR/"
  fi

  if [ -L "$HOME/$file" ]; then
    rm "$HOME/$file"
  fi

  echo "Linking $file"
  ln -s "$DOTFILES_DIR/$file" "$HOME/$file"
done

echo "Dotfiles linked successfully!"
echo "Backup saved to: $BACKUP_DIR"
