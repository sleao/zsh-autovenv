# AutoVenv Plugin

This plugin detects and automatically activates a venv environment when you cd into a folder. Note: it looks for a .venv folder to determine if its a venv environment.


## Installation

1. Clone this repository into `$ZSH_CUSTOM/plugins` (default `~/.oh-my-zsh/custom/plugins/`):
```
git clone https://github.com/sleao/zsh-autovenv ${ZSH_CUSTOM:-~/.oh-my-zsh/custom/}/plugins/zsh-autovenv
```

2. Add the plugin to your oh-my-zsh file:
```
plugins=(
    zsh-autovenv
)
```

3. Start a new terminal session.
