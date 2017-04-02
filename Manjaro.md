sudo pacman-mirrors -g

sudo pacman -Syyu

sudo pacman -S bash-completion

yaourt google-chrome
yaourt -S chromium-pepper-flash

yaourt spotify
sudo ln -s /usr/lib/libnss3.so /usr/lib/libnss3.so.1d && sudo ln -s 
/usr/lib/libnssutil3.so /usr/lib/libnssutil3.so.1d && sudo ln -s 
/usr/lib/libsmime3.so /usr/lib/libsmime3.so.1d && sudo ln -s 
/usr/lib/libssl3.so /usr/lib/libssl3.so.1d && sudo ln -s 
/usr/lib/libplds4.so /usr/lib/libplds4.so.0d && sudo ln -s 
/usr/lib/libplc4.so /usr/lib/libplc4.so.0d && sudo ln -s 
/usr/lib/libnspr4.so /usr/lib/libnspr4.so.0d && sudo ln -s 
/usr/lib/libudev.so /usr/lib/libudev.so.0

pacman -S git

git clone https://aur.archlinux.org/numix-icon-theme-git.git 
./MKPKG
copy Numix and Numix-Light to /usr/share/icons

pacman -S vlc

sudo pacman -S arc-gtk-theme

sudo pacman -S vim

pacman -S wireless_tools

Packages to install from AUR(enable in package manager)
Skype
TeamViewer
