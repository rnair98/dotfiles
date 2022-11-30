# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

eval "$(zoxide init zsh)"

autoload -Uz compinit
compinit

# source plugins
source ~/.zsh_plugins.sh

# use nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; 
  then . $HOME/.nix-profile/etc/profile.d/nix.sh;
fi

# customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export TERM="xterm-color"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# aliases
alias zshconfig="mate ~/.zshrc"
alias -g vim="nvim"
alias -g goto="z"
alias -g ls="ls"
alias deactivate="conda deactivate"
alias e="emacsclient -t"

alias md="mkdir -p"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export EMACS_HOME="$HOME/.emacs.d"
export PATH="$EMACS_HOME/bin:$PATH"

export RUST_HOME="$HOME/.cargo"
export PATH="$RUST_HOME/bin:$PATH"

export BUN_HOME="$HOME/.bun"
export PATH="$BUN_HOME/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rohit/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rohit/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rohit/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rohit/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/home/rohit/.bun/_bun" ] && source "/home/rohit/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
