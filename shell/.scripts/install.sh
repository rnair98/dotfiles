#sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
#libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
#libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev


# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install tealdeer ripgrep coreutils bat broot du-dust exa fd-find gping procs sd skim tokei ytop zoxide

source $HOME/.cargo/env

curl -sS https://starship.rs/install.sh | sh
curl https://get.volta.sh | bash

source $HOME/.bashrc

volta install node
volta install npm@latest
volta install bun

curl -s "https://get.sdkman.io" | bash


#curl https://pyenv.run | bash

#source $HOME/.bashrc

#pyenv install 3.12.1
#pyenv global 3.12.1

#pip install --upgrade pip poetry

sudo apt install httpie

sh <(curl -L https://nixos.org/nix/install) --daemon

# Downloads
cd $HOME/Downloads


wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
chmod u+x nvim.appimage && ./nvim.appimage
sudo ln -s $HOME/Downloads/nvim.appimage /usr/local/bin/nvim
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
npm install -g neovim
pip install pynvim

wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
tar -zxf tmux-*.tar.gz
rm tmux-*.tar.gz
cd tmux-*/
./configure
make && sudo make install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

wget https://github.com/jarun/nnn/releases/download/v4.9/nnn-v4.9.tar.gz
tar -zxf nnn-*.tar.gz
rm nnn-*.tar.gz
cd nnn-*/
sudo apt install pkg-config libncursesw5-dev libreadline-dev
sudo make strip install
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"

# Docker - Debian Install
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


