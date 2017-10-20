# .zshrc

# Set the path of zsh configuration directory
export ZSH_HOME=$HOME/.zsh

# Load a configuration of oh-my-zsh
[ -f $ZSH_HOME/oh-my-zsh.zshrc ] && source $ZSH_HOME/oh-my-zsh.zshrc

# Load a general configuration of zsh
[ -f $ZSH_HOME/general.zshrc ] && source $ZSH_HOME/general.zshrc

[ -z "$TMUX" ] && exec tmux
