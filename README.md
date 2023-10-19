# Config files

## Install dependencies

1. neovim
2. tmux
3. go (for efm-language-server)
4. fzf
5. ripgrep (apt or homebrew)
6. Tmux package manager https://github.com/tmux-plugins/tpm

## Configure

1. Checkout this repo in ~/.config
2. Install zprezto with XDC_CONFIG_HOME options without the config copy
3. Install Homebrew
4. Install Homebrew packages `brew bundle`
3. Install Tmux Package manager: `https://github.com/tmux-plugins/tpm`
4. OSX Configure brew zsh as shell: `sudo dscl . -create /Users/geert UserShell /opt/homebrew/bin/zsh`

## Check for changes in zprezto Config

```bash
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  cp "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```
