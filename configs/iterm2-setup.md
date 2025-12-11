# iTerm2 Configuration

iTerm2 preferences are stored in `~/Library/Preferences/com.googlecode.iterm2.plist`

## Export Current Settings

```bash
defaults export com.googlecode.iterm2 ~/iterm2-settings.plist
```

## Import Settings

```bash
defaults import com.googlecode.iterm2 ~/iterm2-settings.plist
```

## Recommended Settings

- **Theme**: Dracula (included in presets)
- **Font**: Install a Nerd Font for icons (MesloLGS NF for Powerlevel10k)
- **Scrollback**: 10000 lines minimum
- **Enable**: "Reuse previous session's directory"
- **Disable**: "Confirm closing multiple sessions"

## Installation

iTerm2 is installed via Brewfile:
```bash
brew install --cask iterm2
```

Note: Manual configuration recommended via Preferences UI
