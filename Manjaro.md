### Package Manager ###

__Update Mirrors__
sudo pacman-mirrors -g

__Update__
sudo pacman -Syyu

__Add command completion__
sudo pacman -S bash-completion

### System tools/softwares ###

__Network__
pacman -S wireless_tools

sudo pacman -S extra/nmap

__pacaur__
Refer [this](https://gist.github.com/Tadly/0e65d30f279a34c33e9b)

### 3rd Party Packages ###

__Chrome__
yaourt google-chrome

__Flash__
yaourt -S chromium-pepper-flash

__Spotify__
yaourt spotify

__ADB__
pacman -S community/android-tools

sudo ln -s /usr/lib/libnss3.so /usr/lib/libnss3.so.1d && 
sudo ln -s /usr/lib/libnssutil3.so /usr/lib/libnssutil3.so.1d && 
sudo ln -s /usr/lib/libsmime3.so /usr/lib/libsmime3.so.1d && 
sudo ln -s /usr/lib/libssl3.so /usr/lib/libssl3.so.1d && 
sudo ln -s /usr/lib/libplds4.so /usr/lib/libplds4.so.0d && 
sudo ln -s /usr/lib/libplc4.so /usr/lib/libplc4.so.0d && 
sudo ln -s /usr/lib/libnspr4.so /usr/lib/libnspr4.so.0d && 
sudo ln -s /usr/lib/libudev.so /usr/lib/libudev.so.0

__Git__
pacman -S git

__VLC__
pacman -S vlc

__Vim__
sudo pacman -S vim

__Docker__
pacman -S docker docker-compose

### AUR ###

_Packages to install from AUR(enable in package manager)_

* Skype
* TeamViewer
* Sublime

### Customization ###

__Numix icon theme__
git clone https://aur.archlinux.org/numix-icon-theme-git.git 
./MKPKG
copy Numix and Numix-Light to /usr/share/icons

__Arc GTK Theme__
sudo pacman -S arc-gtk-theme



