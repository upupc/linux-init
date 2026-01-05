#!/bin/sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"

bash Miniforge3-$(uname)-$(uname -m).sh

conda init

curl -fsSL https://claude.ai/install.sh | bash

mkdir -p ~/.local/bin

echo "source ~/.local/completions/_proxy-switch" >> ~/.bashrc

git clone https://github.com/upupc/proxy-switch.git /tmp/proxy-switch

cd /tmp/proxy-switch

./install.sh

cd ~

rm -rf /tmp/proxy-switch



