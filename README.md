# Config files

## Install dependencies

1. neovim
2. tmux
3. go (for efm-language-server)
4. fzf
5. ripgrep (apt or homebrew)

## Configure

1. Checkout this repo in ~/.config
2. Install zprezto with XDC_CONFIG_HOME options without the config copy

## Check for changes in zprezto Config

```bash
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  cp "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```
