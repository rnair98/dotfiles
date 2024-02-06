#sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
#libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
#libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

curl -sS https://starship.rs/install.sh | sh
curl https://get.volta.sh | bash

source $HOME/.bashrc

volta install node
volta install npm@latest
volta install bun

curl -s "https://get.sdkman.io" | bash


curl https://pyenv.run | bash

source $HOME/.bashrc

pyenv install 3.12.1
pyenv global 3.12.1

pip install --upgrade pip poetry

sudo apt install httpie

