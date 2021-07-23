#########################################################################
# File Name: install-some.sh
# Author: 
# mail: 
# Created Time: 2021年03月13日 星期六 16时11分10秒
#########################################################################
#!/bin/bash
PATH_USER=/home/$(whoami)
PATH_PWD=$(pwd)
PATH_TOOLS=$(PATH_USER)/tools

echo "config -->> $(PATH_USER)/.config && ssh -->> $(PATH_USER)/.ssh"
cp -rf ./config/* $(PATH_USER)/.config 
cp -rf ./ssh $(PATH_USER)/.ssh && cd $(PATH_USER)/.ssh && chmod 600 *
cd $(PATH_PWD)

wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
sudo ln -sf /home/lalala/.joplin/Joplin.AppImage /usr/bin/joplin 

sudo apt install htop -y
sudo apt install net-tools -y
sudo apt install python -y
sudo apt install python3 -y

python $(PATH_PWD)/get-pip.py
python3 $(PATH_PWD)/get-pip.py

cp -rf ./pip $(PATH_USER)/.pip

echo "git config"
# sudo apt install git -y
git config --globe user.name "Jyc-Code"
git config --globe user.email "15888788015@163.com"
cp ./gitconfig $(PATH_USER)/.gitconfig
echo "install source code pro"
sudo cp -rf ./code-font/source-code-pro /usr/share/fonts/truetype
sudo fc-cache -f -v

echo "install st and dwm"
if [ ! -d $PATH_TOOLS ];
then mkdir $PATH_TOOLS;
fi
cd $(PATH_TOOLS)
git clone git@github.com:Jyc-Code/st.git
git clone git@github.com:Jyc-Code/dwm.git

# install some lib
# cd st
sudo apt install compton -y
sudo apt install dmenu -y

cd $(PATH_PWD)
cp ./xinitrc $(PATH_USER)/.xinitrc

echo "install zsh"
sudo apt install zsh -y
./install_om_zsh.sh
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $(PATH_USER)/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $(PATH_USER)/.oh-my-zsh/plugins/zsh-autosuggestions

cp ./zshrc $(PATH_USER)/.zshrc
cp ./dircolors $(PATH_USER)/.dircolors

echo "install google-chrome"
sudo wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
sudo apt update
sudo apt install google-chrome-stable -y

cd $(PATH_PWD)
echo "neovim install"
sudo apt install curl
# 最新版本
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# neovim 4.4
# curl -LO https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
chmod 777 nvim.appimage && mv nvim.appimage nvim
sudo cp ./nvim /usr/bin
sudo ln -s /usr/bin/nvim /usr/bin/vi
echo "install some nvim env"
sudo apt install nodejs -y
sudo apt install npm -y
sudo npm config set registry https://registry.npm.taobao.org
sudo npm config list
sudo npm install -g n
sudo n stable
sudo npm install -g neovim

cp ./config/nvim $(PATH_USER)/.config
sudo pip install --upgrade neovim
sudo pip3 install --upgrade neovim
echo "install ruby and gem"
sudo add-apt-repository ppa:brightbox/ruby-ng
sudo apt-get purge ruby
sudo apt install ruby
sudo apt install ruby2.5-dev
sudo gem install neovim
echo "install bat"
sudo apt install gdepi
curl -LO https://github.com/sharkdp/bat/releases/download/v0.18.1/bat_0.18.1_amd64.deb
sudo gdepi install bat_0.18.1_amd64.deb
echo "install some language-server"
sudo npm i -g vscode-langservers-extracted
sudo npm install -g vim-language-server
sudo npm install -g pyright
sudo npm install -g typescript typescript-language-server

echo "install clangd and ccls"
# sudo apt install clangd-9 -y
# sudo apt install snapd
# sudo snap install ccls --classic

echo "install rime"
sudo apt install fcitx -y
sudo apt install fcitx-rime -y
cp ./config/fcitx $(PATH_USER)/.config -rf

echo "install linuxbrew"
bash ./linuxbrew/uninstall.sh
bash ./linuxbrew/install.sh
bash ./linuxbrew/autoInitBrew.sh

brew install cmake gcc 
echo "cmake need version > 3.12 ,gcc support c++17"
curl -LO https://github.com/rizsotto/Bear/archive/refs/tags/3.0.13.tar.gz
tar -zxvf 3.0.13.tar.gz
cd Bear-3.0.13
echo "go to Bear dir"
cmake -DENABLE_UNIT_TESTS=OFF -DENABLE_FUNC_TESTS=OFF $BEAR_SOURCE_DIR
make all
make install
echo "install /usr/local/"
cd $(PATH_PWD)

echo "rust install"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

rustup update
rustup component add rust-src
# rustup +nightly component add rust-analyzer-preview
brew install rust-analyzer
sudonpm i -g bash-language-server
