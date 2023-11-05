if status is-interactive
    # Commands to run in interactive sessions can go here
set -g __sdkman_custom_dir /home/arconte/.sdkman/bin
set PATH $PATH /home/arconte/.sdkman/candidates/java/current/bin
set PATH $PATH /home/arconte/.cargo/bin
#set PATH $PATH /home/arconte/idea-IU/bin
#set PATH $PATH ~/firefox

eval zoxide init fish | source
eval starship init fish | source
end
set -U SXHKD_SHELL /usr/bin/bash
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -Ux RUST_SRC_PATH "/home/arconte/.rustup/toolchains/stable-x86_64-unknown-linux-gnu"
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH "$PYENV_ROOT/bin" $PATH

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/home/arconte/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/home/arconte/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/arconte/micromamba/bin/conda "shell.fish" "hook" $argv | source

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
