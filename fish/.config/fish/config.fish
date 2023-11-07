if status is-interactive
    # Commands to run in interactive sessions can go here
set -g __sdkman_custom_dir $HOME/.sdkman/bin
set PATH $PATH $HOME/.sdkman/candidates/java/current/bin
set PATH $PATH $HOME/.cargo/bin
#set PATH $PATH /home/arconte/idea-IU/bin
#set PATH $PATH ~/firefox

eval zoxide init fish | source
eval starship init fish | source   
end
set -U SXHKD_SHELL /usr/bin/bash
set -gx VOLTA_HOME $HOME/.volta
set -gx PATH $VOLTA_HOME/bin $PATH
set -Ux RUST_SRC_PATH $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH $PYENV_ROOT/bin $PATH

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "$HOME/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "$HOME/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

while set pyenv_index (contains -i -- $HOME/.pyenv/shims $PATH)
set -eg PATH[$pyenv_index]; end; set -e pyenv_index
set -gx PATH $HOME/.pyenv/shims $PATH
set -gx PYENV_SHELL fish
source $HOME/.pyenv/completions/pyenv.fish
command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case activate deactivate rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end

while set index (contains -i -- $HOME/.pyenv/plugins/pyenv-virtualenv/shims $PATH)
set -eg PATH[$index]; end; set -e index
set -gx PATH $HOME/.pyenv/plugins/pyenv-virtualenv/shims $PATH;
set -gx PYENV_VIRTUALENV_INIT 1;
function _pyenv_virtualenv_hook --on-event fish_prompt;
  set -l ret $status
  if [ -n $VIRTUAL_ENV ]
    pyenv activate --quiet; or pyenv deactivate --quiet; or true
  else
    pyenv activate --quiet; or true
  end
  return $ret
end

# Created by `pipx` on 2023-11-07 21:21:04
set PATH $PATH /home/ubuntu/.local/bin
