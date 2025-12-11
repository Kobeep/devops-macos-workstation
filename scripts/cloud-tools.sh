#!/bin/bash

set -e

echo "INFO ==>: Setting up cloud provider tools..."

echo "INFO ==>: Installing AWS CLI..."
if ! command -v aws >/dev/null 2>&1; then
  brew install awscli
fi

echo "INFO ==>: Installing Azure CLI..."
if ! command -v az >/dev/null 2>&1; then
  brew install azure-cli
fi

echo "INFO ==>: Installing Google Cloud SDK..."
if ! command -v gcloud >/dev/null 2>&1; then
  brew install --cask gcloud-cli
fi

echo "INFO ==>: Cloud tools setup complete!"
echo ""
echo "INFO ==>: Available CLIs:"
echo "INFO ==>:   aws     - Amazon Web Services"
echo "INFO ==>:   az      - Microsoft Azure"
echo "INFO ==>:   gcloud  - Google Cloud Platform"
echo ""
echo "INFO ==>: Next steps:"
echo "INFO ==>:   aws configure"
echo "INFO ==>:   az login"
echo "INFO ==>:   gcloud init"
