#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/../dotfiles" 2>/dev/null && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
BACKUP_CREATED=false

echo "INFO ==>: Creating dotfiles symlinks..."

if [ -z "$DOTFILES_DIR" ] || [ ! -d "$DOTFILES_DIR" ]; then
  echo "INFO ==>: Error: dotfiles directory not found relative to $SCRIPT_DIR"
  exit 1
fi

files=(".zshrc")

for file in "${files[@]}"; do
  TARGET="$HOME/$file"
  SRC="$DOTFILES_DIR/$file"

  # Check if target is already correctly symlinked
  if [ -L "$TARGET" ] && [ "$(readlink "$TARGET")" = "$SRC" ]; then
    echo "INFO ==>: ✓ $file is already correctly symlinked"
    continue
  fi

  # Backup existing file if it's not a symlink
  if [ -f "$TARGET" ] && [ ! -L "$TARGET" ]; then
    if [ "$BACKUP_CREATED" = false ]; then
      mkdir -p "$BACKUP_DIR"
      BACKUP_CREATED=true
      echo "INFO ==>: Backup directory created: $BACKUP_DIR"
    fi
    echo "INFO ==>: Backing up existing $file"
    mv "$TARGET" "$BACKUP_DIR/"
  elif [ -L "$TARGET" ]; then
    rm "$TARGET"
  fi

  echo "INFO ==>: Linking $file"
  ln -s "$SRC" "$TARGET"
done

echo "INFO ==>: Dotfiles setup complete!"
if [ "$BACKUP_CREATED" = true ]; then
  echo "INFO ==>: Backup saved to: $BACKUP_DIR"
fi
