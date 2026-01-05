#!/bin/sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

curl -L -o /tmp/Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"

# 安装 Miniforge3（如果已存在则更新）
if [ -d "/root/miniforge3" ]; then
    bash /tmp/Miniforge3.sh -u
else
    bash /tmp/Miniforge3.sh
fi

source ~/.bashrc

conda init

source ~/.bashrc

rm -rf /tmp/Miniforge3.sh

curl -fsSL https://claude.ai/install.sh | bash

mkdir -p ~/.local/bin

git clone https://github.com/upupc/proxy-switch.git /tmp/proxy-switch

cd /tmp/proxy-switch

chmod +x ./install.sh ./bin/proxy-switch ./completions/_proxy-switch

./install.sh

cd ~

rm -rf /tmp/proxy-switch

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

# 添加 cc-switch 命令别名（避免重复写入）
if ! grep -qF "alias csps='cc-switch provider switch'" ~/.bashrc; then
    echo "alias csps='cc-switch provider switch'" >> ~/.bashrc
fi

nvm install 24

source ~/.bashrc

# 添加 proxy-switch 命令补全（避免重复写入）
if ! grep -qF "source ~/.local/completions/_proxy-switch" ~/.bashrc; then
    echo "source ~/.local/completions/_proxy-switch" >> ~/.bashrc
fi


