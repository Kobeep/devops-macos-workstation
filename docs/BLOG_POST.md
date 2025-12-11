# Blog Post Template

## DevOps macOS Workstation: Automate Your Mac Setup in Minutes

### Introduction

Setting up a new Mac as a DevOps engineer is time-consuming. Between installing Docker, Kubernetes tools, cloud CLIs, and configuring your terminal, it can take hours or even days to get everything just right.

I created **DevOps macOS Workstation** to solve this problem once and for all.

### What It Does

This automated setup tool installs and configures everything you need:

- **Kubernetes Tools**: kubectl, helm, k9s, kubectx, stern
- **Cloud CLIs**: AWS, Azure, Google Cloud
- **Infrastructure as Code**: Terraform, Ansible
- **Container Tools**: Docker Desktop, lazydocker, dive
- **Terminal Setup**: oh-my-zsh with Powerlevel10k theme
- **CLI Utilities**: bat, eza, fzf, ripgrep, jq, yq, and more

### Quick Start

```bash
git clone https://github.com/Kobeep/devops-macos-workstation.git ~/github/devops-macos-workstation
cd ~/github/devops-macos-workstation
./install.sh
```

Choose your profile:
1. **Essential** - Basic tools only
2. **Full DevOps Stack** - Everything including configs
3. **Custom** - Pick what you need

### Key Features

#### 🎯 Profile-Based Installation
Not everyone needs everything. Choose exactly what you want to install.

#### ⚙️ Dotfiles Management
Your zsh configuration is symlinked with automatic backup. Never lose your settings again.

#### 🔧 Pre-configured Aliases
Tired of typing `kubectl get pods`? Just use `kgp`. Over 20 time-saving aliases included.

#### 📦 Modular Scripts
Each component has its own script. Want to just install Kubernetes tools? Run `./scripts/kubernetes.sh`

#### 🎨 Beautiful Terminal
Powerlevel10k theme with syntax highlighting and autosuggestions pre-configured.

### Why I Built This

After setting up my Mac for the 5th time this year (new machine, fresh installs, testing), I was tired of:
- Googling installation commands
- Forgetting which tools I needed
- Manually configuring oh-my-zsh every time
- Losing my aliases and shortcuts

Now it's one command and 10 minutes.

### Contribute

The project is open source and contributions are welcome! Found a tool that should be included? Open a PR.

GitHub: https://github.com/Kobeep/devops-macos-workstation

### Conclusion

If you're a DevOps engineer on Mac, this tool can save you hours of setup time. Give it a try and let me know what you think!

---

## Where to Post

### Dev.to
- Tags: `devops`, `macos`, `automation`, `kubernetes`, `terraform`
- Series: "DevOps Tools"

### Medium
- Publication: Better Programming, Level Up Coding, Dev Genius

### Hashnode
- Tags: `devops`, `automation`, `macos`

### Reddit
- r/devops
- r/macOS
- r/kubernetes
- r/commandline

### LinkedIn
Post with hashtags: #DevOps #MacOS #Automation #Kubernetes #Terraform
