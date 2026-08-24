#!/bin/bash

set -e

echo "INFO ==>: Setting up CLI utilities..."

tools=(
  "bat:bat:Clone of cat with syntax highlighting"
  "eza:eza:Modern ls replacement"
  "fzf:fzf:Fuzzy finder"
  "ripgrep:rg:Fast grep alternative"
  "fd:fd:Fast find alternative"
  "jq:jq:JSON processor"
  "yq:yq:YAML processor"
  "htop:htop:Interactive process viewer"
  "httpie:http:User-friendly HTTP client"
  "tldr:tldr:Simplified man pages"
  "gh:gh:GitHub official CLI"
  "shellcheck:shellcheck:Shell script linter"
  "tree:tree:Directory tree viewer"
  "broot:broot:Interactive directory tree explorer"
  "git-delta:delta:Git diff syntax-highlighting pager"
)

for tool_info in "${tools[@]}"; do
  IFS=':' read -r pkg cmd desc <<< "$tool_info"

  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "INFO ==>: Installing $pkg ($desc)..."
    brew install "$pkg"
  else
    echo "INFO ==>: ✓ $pkg already installed"
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
