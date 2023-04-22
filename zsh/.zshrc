if [ -f $HOME/.nix-profile/etc/profile.d/nix.sh ];
then
	source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.emacs.d/bin:$PATH
export TERM=xterm
export TMUX=xterm-256color
export GTK_PATH=/usr/lib/gtk-3.0
export DENO_INSTALL="/home/marethyu/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/var/lib/snapd/snap/bin:$PATH"
eval "$(zoxide init zsh)"
#eval "$(tmux attach || tmux)"
#clear
# source plugins
source ~/.zsh_plugins.sh

# customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=$LC_CTYPE

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# aliases
alias -g mm="micromamba"
alias zshconfig="mate ~/.zshrc"
alias -g vim="nvim"
alias -g goto="z"
alias deactivate="conda deactivate"


export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/nix/store/bzcjvsq2d2d4iwyb2x5ssf8bafcw5bqm-micromamba-0.25.0/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/marethyu/micromamba";
__mamba_setup="$('/nix/store/bzcjvsq2d2d4iwyb2x5ssf8bafcw5bqm-micromamba-0.25.0/bin/micromamba' shell hook --shell zsh --prefix '/home/marethyu/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/marethyu/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/marethyu/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/marethyu/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/home/marethyu/.bun/_bun" ] && source "/home/marethyu/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
