if status is-interactive
    # Commands to run in interactive sessions can go here
set -g __sdkman_custom_dir $HOME/.sdkman/bin
set PATH $PATH $HOME/.sdkman/candidates/java/current/bin
set PATH $PATH $HOME/.cargo/bin
#set PATH $PATH $HOME/idea-IU/bin
#set PATH $PATH ~/firefox

eval zoxide init fish | source
eval starship init fish | source
end
set -U SXHKD_SHELL /usr/bin/bash
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -Ux RUST_SRC_PATH "$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu"
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH "$PYENV_ROOT/bin" $PATH

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "$HOME/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "$HOME/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/arconte/micromamba/bin/conda "shell.fish" "hook" $argv | source

eval pyenv init -
eval pyenv virtualenv-init -
