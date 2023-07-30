# Overview

`Kubecolor` is an opersource tool that prints colorized outputs from the main kubernetes cli tool `kubectl`, so this is a functional plugin thats allows you to add functional keyboard shortcuts to `ZSH` and `Oh-My-ZSH`
# Install

### 1 - Pre-Requisites

```bash
brew install hidetatz/tap/kubecolor
brew install fzf
$(brew --prefix)/opt/fzf/install
```

### 2 - Configure Kubecolor

Follow steps described in the official [GitHub Repo](https://github.com/hidetatz/kubecolor)

### 3 - Install this custom plugin

```bash
git clone https://github.com/devopstales/zsh-kubecolor.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-kubecolor
```

### 4 - Add to ZSHRC

Edit your `.zshrc` config file  and add into the plugins configuration to enable shortcuts:

```bash
plugins=(
  git
  plugin-a
  plugin-b
  plugin-c
  zsh-kubecolor
  plugin-n
)
```

### 5 - Reload your shell or source zshrc
```bash
exec $SHELL
# OR
source ~/.zshrc
```

Enjoy it and don't forget submit any comment or issue.
