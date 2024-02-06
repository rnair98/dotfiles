cd $HOME/Downloads
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
chmod u+x nvim.appimage && ./nvim.appimage
sudo ln -s $HOME/Downloads/nvim.appimage /usr/local/bin/nvim
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
