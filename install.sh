#!/bin/bash

set -e

echo "🚀 macOS DevOps Workstation Setup"
echo "=================================="
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Select installation profile:"
echo "1) Essential (brew + basic tools)"
echo "2) Full DevOps Stack (all tools + configs + macOS settings)"
echo "3) Custom (choose components)"
echo ""
read -p "Choice [1-3]: " profile

case $profile in
  1)
    echo "Installing Essential profile..."
    components=("brew")
    ;;
  2)
    echo "Installing Full DevOps Stack..."
    components=("brew" "cli-tools" "kubernetes" "cloud-tools" "dotfiles" "macos-prefs")
    ;;
  3)
    echo "Available components:"
    echo "  [1] Homebrew packages"
    echo "  [2] CLI tools"
    echo "  [3] Kubernetes tools"
    echo "  [4] Cloud provider tools"
    echo "  [5] Dotfiles"
    echo "  [6] macOS preferences"
    read -p "Select components (e.g., 1,2,5,6): " choices
    components=()
    [[ $choices =~ 1 ]] && components+=("brew")
    [[ $choices =~ 2 ]] && components+=("cli-tools")
    [[ $choices =~ 3 ]] && components+=("kubernetes")
    [[ $choices =~ 4 ]] && components+=("cloud-tools")
    [[ $choices =~ 5 ]] && components+=("dotfiles")
    [[ $choices =~ 6 ]] && components+=("macos-prefs")
    ;;
  *)
    echo "Invalid choice"
    exit 1
    ;;
esac

for component in "${components[@]}"; do
  echo ""
  echo "INFO ==>: 📦 Installing $component..."

  case $component in
    brew)
      if [ -f "$SCRIPT_DIR/scripts/brew.sh" ]; then
        bash "$SCRIPT_DIR/scripts/brew.sh"
      else
        echo "INFO ==>: Installing Homebrew packages from Brewfile..."
        if command -v brew >/dev/null 2>&1; then
          brew bundle --file="$SCRIPT_DIR/Brewfile"
        else
          echo "INFO ==>: Homebrew not installed. Install from https://brew.sh"
        fi
      fi
      ;;
    cli-tools)
      [ -f "$SCRIPT_DIR/scripts/cli-tools.sh" ] && bash "$SCRIPT_DIR/scripts/cli-tools.sh"
      ;;
    kubernetes)
      [ -f "$SCRIPT_DIR/scripts/kubernetes.sh" ] && bash "$SCRIPT_DIR/scripts/kubernetes.sh"
      ;;
    cloud-tools)
      [ -f "$SCRIPT_DIR/scripts/cloud-tools.sh" ] && bash "$SCRIPT_DIR/scripts/cloud-tools.sh"
      ;;
    dotfiles)
      [ -f "$SCRIPT_DIR/scripts/symlink-dotfiles.sh" ] && bash "$SCRIPT_DIR/scripts/symlink-dotfiles.sh"
      ;;
    macos-prefs)
      [ -f "$SCRIPT_DIR/scripts/macos-preferences.sh" ] && bash "$SCRIPT_DIR/scripts/macos-preferences.sh"
      ;;
  esac
done

echo ""
echo "INFO ==>: ✅ Installation complete!"
echo ""
echo "INFO ==>: Next steps:"
echo "INFO ==>:   - Restart your terminal"
echo "INFO ==>:   - Run 'brew doctor' to verify setup"
echo "INFO ==>:   - Configure cloud provider credentials"
