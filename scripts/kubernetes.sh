#!/bin/bash

set -e

echo "INFO ==>: Setting up Kubernetes tools..."

if ! command -v kubectl >/dev/null 2>&1; then
  echo "INFO ==>: kubectl not found. Install via: brew install kubernetes-cli"
  exit 1
fi

echo "INFO ==>: Installing oh-my-zsh kubectl plugin..."
if [ -d "$HOME/.oh-my-zsh" ]; then
  if ! grep -q "kubectl" "$HOME/.zshrc"; then
    echo "INFO ==>: Add 'kubectl' to plugins in ~/.zshrc"
  fi
fi

echo "INFO ==>: Installing kubectx/kubens..."
if ! command -v kubectx >/dev/null 2>&1; then
  brew install kubectx
fi

echo "INFO ==>: Installing k9s..."
if ! command -v k9s >/dev/null 2>&1; then
  brew install k9s
fi

echo "INFO ==>: Installing helm..."
if ! command -v helm >/dev/null 2>&1; then
  brew install helm
fi

echo "INFO ==>: Installing stern..."
if ! command -v stern >/dev/null 2>&1; then
  brew install stern
fi

echo "INFO ==>: Kubernetes tools setup complete!"
echo ""
echo "INFO ==>: Available tools:"
echo "INFO ==>:   kubectl - Kubernetes CLI"
echo "INFO ==>:   kubectx - Switch contexts"
echo "INFO ==>:   kubens  - Switch namespaces"
echo "INFO ==>:   k9s     - Terminal UI"
echo "INFO ==>:   helm    - Package manager"
echo "INFO ==>:   stern   - Multi-pod logs"
