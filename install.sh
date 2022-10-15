# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
    nixpkgs.git \
    nixpkgs.docker \
    nixpkgs.zsh \
    nixpkgs.stow \
    nixpkgs.direnv \
    nixpkgs.qemu_full \
    nixpkgs.pandoc \
    nixpkgs.antibody \
    nixpkgs.rustup \
    nixpkgs.tmux \
    nixpkgs.lsd \
    nixpkgs.xsv \
    nixpkgs.jless \
    nixpkgs.fzf \
    nixpkgs.ripgrep \
    nixpkgs.bat \
    nixpkgs.tealdeer \
    nixpkgs.neovim \
    nixpkgs.vimPlugins.vim-plug \
    nixpkgs.emacs-nox \
    nixpkgs.fd \
    nixpkgs.procs \
    nixpkgs.du-dust \
    nixpkgs.sd \
    nixpkgs.tokei \
    nixpkgs.neofetch \
    nixpkgs.htop \
    nixpkgs.grex \
    nixpkgs.zoxide \
    nixpkgs.julia \
    #nixpkgs.octave \
    #nixpkgs.R \
    #nixpkgs.fira-code \
    #nixpkgs.cm_unicode \
    #nixpkgs.lmmath \
    #nixpkgs.cascadia-code \
    #nixpkgs.micromamba
    #nixpkgs.foliate \
    #nixpkgs.bitwarden \
    #nixpkgs.calibre \
    #nixpkgs.keepassxc \
    #nixpkgs.veracrypt \
    #nixpkgs.zoom-us \
    #nixpkgs.zettlr \
    #nixpkgs.virtualboxWithExtpack \
    #nixpkgs.virt-manager \
    #nixpkgs.bottles \
    #nixpkgs.obsidian - for graphical installs only\
    #nixpkgs.spotify - for graphical installs only\
    #nixpkgs.chromium - for graphical installs only\
    #nixpkgs.librewolf - for graphical installs only\
    #nixpkgs.vscode - for graphical installs only \
    #nixpkgs.alacritty - for graphical installs only

# add zsh as default login shell
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER

# stow directories
stow shell
stow zsh
stow nvim
stow python-envs

# Install Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
stow doom-emacs

# install SDKMAN!
curl -s "https://get.sdkman.io" | zsh
source "~/.sdkman/bin/sdkman-init.sh"
sdk install java

# install Volta!
curl https://get.volta.sh | zsh
. ~/.volta/bin/volta install node
. ~/.volta/bin/volta install npm@latest

# install Mamba
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh"
yes | zsh Mambaforge-Linux-x86_64.sh
. ~/mambaforge/bin/mamba init zsh; source ~/.zshrc
#mamba env create --file notebook.yaml -n notebook
#mamba env create --file nvim.yaml -n nvim

# zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zshrc
