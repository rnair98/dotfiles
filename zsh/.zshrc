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
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export TERM=xterm
export TMUX=xterm-256color
export GTK_PATH=/usr/lib/gtk-3.0
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/var/lib/snapd/snap/bin:$PATH"
eval "$(zoxide init zsh)"

autoload -Uz compinit
compinit
#eval "$(tmux attach || tmux)"
#clear
# source plugins
source ~/.zsh_plugins.sh

# use nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; 
  then . $HOME/.nix-profile/etc/profile.d/nix.sh;
fi

# customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export TERM="xterm-color"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=$LC_CTYPE
export TERM="xterm-color"
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
alias e="emacsclient -t"
alias cat="bat"

alias md="mkdir -p"

# ls, the common ones I use a lot shortened for rapid fire usage
alias ls='lsd'
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
alias lsr='ls -lARFh' #Recursive list of files and directories
alias lsn='ls -1'     #A column contains name of files and directories

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file

alias grep='rg --color auto'
alias sgrep='rg -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
(( $+commands[duf] )) || alias duf='du -sh *'
(( $+commands[fd] )) || alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
autoload -Uz is-at-least
if is-at-least 4.2.0; then
  # open browser on urls
  if [[ -n "$BROWSER" ]]; then
    _browser_fts=(htm html de org net com at cx nl se dk)
    for ft in $_browser_fts; do alias -s $ft='$BROWSER'; done
  fi

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts; do alias -s $ft='$EDITOR'; done

  if [[ -n "$XIVIEWER" ]]; then
    _image_fts=(jpg jpeg png gif mng tiff tif xpm)
    for ft in $_image_fts; do alias -s $ft='$XIVIEWER'; done
  fi

  _media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts; do alias -s $ft=mplayer; done

  #read documents
  alias -s pdf=acroread
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"
fi

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export EMACS_HOME="$HOME/.emacs.d"
export PATH="$EMACS_HOME/bin:$PATH"

export RUST_HOME="$HOME/.cargo"
export PATH="$RUST_HOME/bin:$PATH"

export BUN_HOME="$HOME/.bun"
export PATH="$BUN_HOME/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/arconte/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/arconte/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/arconte/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/arconte/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
