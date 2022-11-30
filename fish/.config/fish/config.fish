if status is-interactive
    # Commands to run in interactive sessions can go here
set PATH $PATH /home/arconte/.sdkman/candidates/java/current/bin
set PATH $PATH /home/arconte/idea-IU/bin
set PATH $PATH ~/firefox

eval zoxide init fish | source
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -Ux RUST_SRC_PATH "/home/arconte/.rustup/toolchains/stable-x86_64-unknown-linux-gnu"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/home/arconte/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/home/arconte/micromamba"
eval "/home/arconte/bin/micromamba" shell hook --shell fish --prefix "/home/arconte/micromamba" | source
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/arconte/micromamba/envs/notebook/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
eval mm activate base
