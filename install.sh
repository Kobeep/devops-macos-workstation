#!/bin/bash

set -e

echo "🚀 macOS DevOps Workstation Setup"
echo "=================================="
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

profile=""
non_interactive=false

while [[ $# -gt 0 ]]; do
  case $1 in
    -p|--profile)
      profile="$2"
      shift 2
      ;;
    -y|--yes|--non-interactive)
      non_interactive=true
      export NONINTERACTIVE=1
      shift
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: $0 [-p profile_number] [-y|--non-interactive]"
      exit 1
      ;;
  esac
done

if [ -z "$profile" ]; then
  if [ -t 0 ]; then
    echo "Select installation profile:"
    echo "1) Essential (brew + basic tools)"
    echo "2) Full DevOps Stack (all tools + oh-my-zsh + configs + macOS settings)"
    echo "3) Custom (choose components)"
    echo ""
    read -r -p "Choice [1-3]: " profile
  else
    echo "INFO ==>: Non-interactive shell detected. Defaulting to Profile 2 (Full DevOps Stack)."
    profile="2"
  fi
fi

case $profile in
  1)
    echo "INFO ==>: Installing Essential profile..."
    components=("brew")
    ;;
  2)
    echo "INFO ==>: Installing Full DevOps Stack..."
    components=("brew" "cli-tools" "kubernetes" "cloud-tools" "desktop-apps" "oh-my-zsh" "dotfiles" "macos-prefs")
    ;;
  3)
    if [ -t 0 ]; then
      echo "Available components:"
      echo "  [1] Homebrew packages"
      echo "  [2] CLI tools"
      echo "  [3] Kubernetes tools"
      echo "  [4] Cloud provider tools"
      echo "  [5] Desktop applications"
      echo "  [6] Oh My Zsh & Powerlevel10k"
      echo "  [7] Dotfiles"
      echo "  [8] macOS preferences"
      read -r -p "Select components (e.g., 1,2,5,6,7): " choices
    else
      choices="1,2,3,4,5,6,7,8"
    fi
    components=()
    [[ $choices =~ 1 ]] && components+=("brew")
    [[ $choices =~ 2 ]] && components+=("cli-tools")
    [[ $choices =~ 3 ]] && components+=("kubernetes")
    [[ $choices =~ 4 ]] && components+=("cloud-tools")
    [[ $choices =~ 5 ]] && components+=("desktop-apps")
    [[ $choices =~ 6 ]] && components+=("oh-my-zsh")
    [[ $choices =~ 7 ]] && components+=("dotfiles")
    [[ $choices =~ 8 ]] && components+=("macos-prefs")
    ;;
  *)
    echo "ERROR: Invalid choice '$profile'"
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
    desktop-apps)
      [ -f "$SCRIPT_DIR/scripts/desktop-apps.sh" ] && bash "$SCRIPT_DIR/scripts/desktop-apps.sh"
      ;;
    oh-my-zsh)
      [ -f "$SCRIPT_DIR/scripts/oh-my-zsh.sh" ] && bash "$SCRIPT_DIR/scripts/oh-my-zsh.sh"
      ;;
    dotfiles)
      [ -f "$SCRIPT_DIR/scripts/symlink-dotfiles.sh" ] && bash "$SCRIPT_DIR/scripts/symlink-dotfiles.sh"
      ;;
    macos-prefs)
      if [ -f "$SCRIPT_DIR/scripts/macos-preferences.sh" ]; then
        if [ "$non_interactive" = true ]; then
          bash "$SCRIPT_DIR/scripts/macos-preferences.sh" -y
        else
          bash "$SCRIPT_DIR/scripts/macos-preferences.sh"
        fi
      fi
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
