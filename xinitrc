export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx &

while xsetroot -name " $(LC_ALL='C' date +'%F[%b %a] %R')"
do
  sleep 2
done &

exec dwm


