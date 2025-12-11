#!/bin/bash

set -e

echo "Setting up cloud provider tools..."

echo "Installing AWS CLI..."
if ! command -v aws >/dev/null 2>&1; then
  brew install awscli
fi

echo "Installing Azure CLI..."
if ! command -v az >/dev/null 2>&1; then
  brew install azure-cli
fi

echo "Installing Google Cloud SDK..."
if ! command -v gcloud >/dev/null 2>&1; then
  brew install --cask gcloud-cli
fi

echo "Cloud tools setup complete!"
echo ""
echo "Available CLIs:"
echo "  aws     - Amazon Web Services"
echo "  az      - Microsoft Azure"
echo "  gcloud  - Google Cloud Platform"
echo ""
echo "Next steps:"
echo "  aws configure"
echo "  az login"
echo "  gcloud init"
