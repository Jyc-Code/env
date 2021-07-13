#########################################################################
# File Name: autoInitBrew.sh
# Author: lalala
# mail: 
# Created Time: 2021年07月12日 星期一 17时17分32秒
#########################################################################
#!/bin/bash
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$(whoami)/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential

