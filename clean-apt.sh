#########################################################################
# File Name: clean-apt.sh
# Author: lalala
# mail: 
# Created Time: 2021年08月13日 星期五 09时02分48秒
#########################################################################
#!/bin/bash
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
sudo dpkg --configure -a
