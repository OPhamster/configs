# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
# This is useful for the purpose of auto-complete
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# There was a companion prompt for manjaro, that I do not care for,
# the powerlevel10k vanilla seems to be perfectly sound and can be
# persisted in the p10k.zsh file

## load
if [[ -e ~/.config/zsh/aliases.zsh ]]; then
  source ~/.config/zsh/aliases.zsh
fi

if [[ -e ~/.config/zsh/keybinds.zsh ]]; then
    source ~/.config/zsh/keybinds.zsh
fi
setopt interactivecomments

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Load the actual prompt here
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
