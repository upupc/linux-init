#!/bin/sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"

bash Miniforge3-$(uname)-$(uname -m).sh

source ~/.bashrc

conda init

source ~/.bashrc

curl -fsSL https://claude.ai/install.sh | bash

mkdir -p ~/.local/bin

git clone https://github.com/upupc/proxy-switch.git /tmp/proxy-switch

cd /tmp/proxy-switch

chmod +x ./install.sh ./bin/proxy-switch ./completions/_proxy-switch

./install.sh

cd ~

rm -rf /tmp/proxy-switch

echo "source ~/.local/completions/_proxy-switch" >> ~/.bashrc

# Download
curl -L -o /tmp/cc-switch-cli.tar.gz https://github.com/saladday/cc-switch-cli/releases/latest/download/cc-switch-cli-v4.1.2-linux-x64-musl.tar.gz

cd /tmp
# Extract
tar -xzf cc-switch-cli.tar.gz

# Add execute permission
chmod +x cc-switch

# Move to PATH
mv cc-switch ~/.local/bin/

cd ~

rm -rf /tmp/cc-switch-cli.tar.gz /tmp/cc-switch

echo "alias csps='cc-switch provider switch'" >> ~/.bashrc

source ~/.bashrc



