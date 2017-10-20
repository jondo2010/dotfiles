# general.zshrc

### General {{{
  # Define default $PATH and $MANPATH
  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
  export MANPATH="/usr/local/man:$MANPATH"

  # Extend $PATH with ~/.local/bin
  [ -d $HOME/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"

  # Add things from Cargo/Rust
  source $HOME/.cargo/env

  # You may need to manually set your language environment
# export LANG=en_US.UTF-8
#  export LANG="ko_KR.UTF-8"
#  export LANGUAGE="ko_KR:ko:en_US:en"
#  export LC_CTYPE="ko_KR.UTF-8"
#  export LC_NUMERIC="ko_KR.UTF-8"
#  export LC_TIME="en_US.UTF-8"
#  export LC_COLLATE="ko_KR.UTF-8"
#  export LC_MONETARY="ko_KR.UTF-8"
#  export LC_MESSAGES="POSIX"
#  export LC_PAPER="ko_KR.UTF-8"
#  export LC_NAME="ko_KR.UTF-8"
#  export LC_ADDRESS="ko_KR.UTF-8"
#  export LC_TELEPHONE="ko_KR.UTF-8"
#  export LC_MEASUREMENT="ko_KR.UTF-8"
#  export LC_IDENTIFICATION="ko_KR.UTF-8"
#  export LC_ALL=

  # Load alias list
  [ -f $HOME/.alias ] && source $HOME/.alias

  # Set term that supports 256 colors
  #export TERM=screen-256color

  export PROJECT_HOME=$HOME/Devel

  # Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='nvim'
  fi

  export CLICOLOR=1
  export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

  # Turn off shared history
  unsetopt share_history
  setopt no_share_history

  # ssh
  # export SSH_KEY_PATH="~/.ssh/rsa_id"
### }}}
