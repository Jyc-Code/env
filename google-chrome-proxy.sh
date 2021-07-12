#########################################################################
# File Name: google_chrome_proxy.sh
# Author: 
# mail: 
# Created Time: Wed 16 Dec 2020 08:32:26 PM CST
#########################################################################
#!/bin/bash

GTK_THEME=Adwaita:dark google-chrome-stable --proxy-server="socks5://127.0.01:7891;http://127.0.0.1:7890" 2>/dev/null
