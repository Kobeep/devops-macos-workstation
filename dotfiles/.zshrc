if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
  git
  github
  gitignore
  aws
  gcloud
  azure
  terraform
  docker
  docker-compose
  kubectl
  helm
  ansible
  node
  npm
  yarn
  python
  pip
  golang
  rust
  command-not-found
  colored-man-pages
  colorize
  cp
  extract
  history
  jsontools
  sudo
  web-search
  urltools
  encode64
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Kubernetes
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias kctx='kubectl config use-context'
alias kns='kubectl config set-context --current --namespace'

# Terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'

# Docker
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dps='docker ps'
alias di='docker images'
alias drmi='docker rmi'
alias drm='docker rm'

# AWS
alias awswhoami='aws sts get-caller-identity'

# Git
alias gst='git status'
alias gco='git checkout'
alias gcm='git commit -m'
alias gpl='git pull'
alias gps='git push'
alias glog='git log --oneline --graph --decorate'

unsetopt correct_all
unsetopt correct

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
