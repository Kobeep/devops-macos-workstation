#!/bin/bash

set -e

echo "INFO ==>: Setting up oh-my-zsh and Powerlevel10k..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "INFO ==>: Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "INFO ==>: ✓ oh-my-zsh already installed"
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "INFO ==>: Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "INFO ==>: ✓ Powerlevel10k already installed"
fi

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  echo "INFO ==>: Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
  echo "INFO ==>: ✓ zsh-autosuggestions already installed"
fi

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  echo "INFO ==>: Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
  echo "INFO ==>: ✓ zsh-syntax-highlighting already installed"
fi

echo ""
echo "INFO ==>: oh-my-zsh setup complete!"
echo ""
echo "INFO ==>: Next steps:"
echo "INFO ==>:   1. Link dotfiles: ./scripts/symlink-dotfiles.sh"
echo "INFO ==>:   2. Restart terminal"
echo "INFO ==>:   3. Run 'p10k configure' for Powerlevel10k setup"
