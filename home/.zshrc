#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Load alias list
if [[ -s "${ZDOTDIR:-$HOME}/.alias" ]]; then
    source "${ZDOTDIR:-$HOME}/.alias"
fi

# Disable autocorrect guesses. Happens when typing a wrong
# command that may look like an existing one.
unsetopt CORRECT

# Turn off shared history
unsetopt share_history
setopt no_share_history

# This bunch of code displays red dots when autocompleting
expand-or-complete-with-dots() {
    # a command with the tab key, "Oh-my-zsh"-style.
    echo -n "\e[31m...\e[0m"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Add some additional missing key bindings
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# Speed up transition between VI modes
export KEYTIMEOUT=1

autoload bashcompinit
bashcompinit

#[ -f ~/.fzf.zsh ] && source /etc/bash_completion.d/bazel

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if [[ -f $HOME/.cargo ]] source $HOME/.cargo/env

