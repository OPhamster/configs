# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

## load
if [[ -e ~/.config/zsh/aliases.zsh ]]; then
  source ~/.config/zsh/aliases.zsh
fi

if [[ -e ~/.config/zsh/keybinds.zsh ]]; then
    source ~/.config/zsh/keybinds.zsh
fi