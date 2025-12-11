#!/bin/bash

set -e

echo "Setting up CLI utilities..."

tools=(
  "bat:Clone of cat with syntax highlighting"
  "eza:Modern ls replacement"
  "fzf:Fuzzy finder"
  "ripgrep:Fast grep alternative"
  "fd:Fast find alternative"
  "jq:JSON processor"
  "yq:YAML processor"
  "htop:Interactive process viewer"
  "httpie:User-friendly HTTP client"
  "tldr:Simplified man pages"
)

for tool_info in "${tools[@]}"; do
  IFS=':' read -r tool desc <<< "$tool_info"

  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "Installing $tool ($desc)..."
    brew install "$tool"
  else
    echo "✓ $tool already installed"
  fi
done

echo ""
echo "CLI tools setup complete!"
echo ""
echo "Try these commands:"
echo "  bat <file>       - view file with syntax highlighting"
echo "  eza -la          - list files with icons"
echo "  fzf              - interactive file search"
echo "  rg <pattern>     - fast text search"
echo "  fd <name>        - fast file search"
echo "  jq . <file>      - pretty print JSON"
echo "  tldr <command>   - quick command examples"
