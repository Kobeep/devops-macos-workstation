#!/bin/bash

set -e

echo "INFO ==>: Installing desktop applications..."

apps=(
  "visual-studio-code:Code editor"
  "iterm2:Terminal emulator"
  "maccy:Clipboard manager"
)

for app_info in "${apps[@]}"; do
  IFS=':' read -r app desc <<< "$app_info"

  if ! brew list --cask "$app" >/dev/null 2>&1; then
    echo "INFO ==>: Installing $app ($desc)..."
    brew install --cask "$app"
  else
    echo "INFO ==>: ✓ $app already installed"
  fi
done

echo ""
echo "INFO ==>: Desktop applications setup complete!"
echo ""
echo "INFO ==>: Installed applications:"
echo "INFO ==>:   - Visual Studio Code"
echo "INFO ==>:   - iTerm2"
echo "INFO ==>:   - Maccy"
