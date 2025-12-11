#!/bin/bash

set -e

echo "Setting up Kubernetes tools..."

if ! command -v kubectl >/dev/null 2>&1; then
  echo "kubectl not found. Install via: brew install kubernetes-cli"
  exit 1
fi

echo "Installing oh-my-zsh kubectl plugin..."
if [ -d "$HOME/.oh-my-zsh" ]; then
  if ! grep -q "kubectl" "$HOME/.zshrc"; then
    echo "Add 'kubectl' to plugins in ~/.zshrc"
  fi
fi

echo "Installing kubectx/kubens..."
if ! command -v kubectx >/dev/null 2>&1; then
  brew install kubectx
fi

echo "Installing k9s..."
if ! command -v k9s >/dev/null 2>&1; then
  brew install k9s
fi

echo "Installing helm..."
if ! command -v helm >/dev/null 2>&1; then
  brew install helm
fi

echo "Installing stern..."
if ! command -v stern >/dev/null 2>&1; then
  brew install stern
fi

echo "Kubernetes tools setup complete!"
echo ""
echo "Available tools:"
echo "  kubectl - Kubernetes CLI"
echo "  kubectx - Switch contexts"
echo "  kubens  - Switch namespaces"
echo "  k9s     - Terminal UI"
echo "  helm    - Package manager"
echo "  stern   - Multi-pod logs"
