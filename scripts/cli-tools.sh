#!/bin/bash

set -e

echo "INFO ==>: Setting up CLI utilities..."

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
    echo "INFO ==>: Installing $tool ($desc)..."
    brew install "$tool"
  else
    echo "INFO ==>: ✓ $tool already installed"
  fi
done

echo ""
echo "INFO ==>: CLI tools setup complete!"
echo ""
echo "INFO ==>: Try these commands:"
echo "INFO ==>:   bat <file>       - view file with syntax highlighting"
echo "INFO ==>:   eza -la          - list files with icons"
echo "INFO ==>:   fzf              - interactive file search"
echo "INFO ==>:   rg <pattern>     - fast text search"
echo "INFO ==>:   fd <name>        - fast file search"
echo "INFO ==>:   jq . <file>      - pretty print JSON"
echo "INFO ==>:   tldr <command>   - quick command examples"
