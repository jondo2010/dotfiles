set -gx EDITOR nvim

starship init fish | source

source $HOME/.config/fish/conf.d/abbr.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

