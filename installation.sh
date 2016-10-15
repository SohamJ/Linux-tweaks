#Script to automate new Ubuntu install

#get superuser perms
sudo -s

apt-get update
apt-get upgrade
apt-get dist-upgrade


#Java installation
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-7-jdk
sudo apt-get install openjdk-7-jre

#Android
apt-get install git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip python-lunch schedtool \
  aapt zipalign

#Git
git config --global credential.helper 'cache --timeout=36000'

#ADB
sudo apt-get install android-tools-adb android-tools-fastboot
sudo wget -O /etc/udev/rules.d/51-android.rules https://raw.githubusercontent.com/SohamJ/Linux-Tweaks/master/51-android.rules
sudo chmod a+r /etc/udev/rules.d/51-android.rules
sudo service udev restart
#1.0.32
wget -O - https://skia.googlesource.com/skia/+archive/cd048d18e0b81338c1a04b9749a00444597df394/platform_tools/android/bin/linux.tar.gz | tar -zxvf - adb
sudo mv adb /usr/bin/adb
sudo chmod +x /usr/bin/adb

echo "export PATH=/home/soham/android-studio/bin:$PATH" >> ~/.bashrc
#USB
wget -S -O - http://source.android.com/source/51-android.rules | sed "s/soham/$USER/" | sudo tee >/dev/null /etc/udev/rules.d/51-android.rules; sudo udevadm control --reload-rules

#CCACHE
sudo apt-get install ccache
echo "export USE_CCACHE=1" >> ~/.bashrc
prebuilts/misc/linux-x86/ccache/ccache -M 50G

#32 bit libs
apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6

#Repo
mkdir ~/bin
echo "PATH=~/bin:$PATH" >> ~/.bashrc
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

#Disable apport - /etc/default/apport -> enable=0

#ubuntu restricted extras
apt-get install ubuntu-restricted-extras

# Softwares

#Gdebi
apt-get install gdebi gdebi-core

#Chrome

#nemo
apt-get install nemo

#disable nautilus auto open on auto mount
gsettings set org.gnome.desktop.media-handling automount-open false

#disable nautilus recursive search
gsettings set org.gnome.nautilus.preferences enable-interactive-search true

#VLC
sudo apt-get install vlc
#https://github.com/exebetche/vlsub/ download zip
sudo cp vlsub.lua /usr/lib/vlc/lua/extensions/

#Skype
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install skype

#Spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client

sudo wget https://dl.dropboxusercontent.com/u/8593574/Spotify/ffmpeg/libavcodec.so.53 -O /usr/lib/x86_64-linux-gnu/libavcodec.so.53
sudo wget https://dl.dropboxusercontent.com/u/8593574/Spotify/ffmpeg/libavformat.so.53 -O /usr/lib/x86_64-linux-gnu/libavformat.so.53
sudo wget https://dl.dropboxusercontent.com/u/8593574/Spotify/ffmpeg/libavutil.so.51 -O /usr/lib/x86_64-linux-gnu/libavutil.so.51


sudo apt install ubuntu-restricted-extras ffmpeg libavcodec-extra libavcodec-extra57 libavutil55 libavformat57 zenity -y
git clone https://github.com/ramedeiros/spotify_libraries.git
cd spotify_libraries
sudo cp lib* /usr/lib/x86_64-linux-gnu/
sudo ldconfig
sudo ln -frs /usr/lib/x86_64-linux-gnu/libavutil.so.52.6.100 /usr/lib/x86_64-linux-gnu/libavutil.so.52
sudo ln -frs /usr/lib/x86_64-linux-gnu/libavformat.so.54.36.100 /usr/lib/x86_64-linux-gnu/libavformat.so.54
sudo ln -frs /usr/lib/x86_64-linux-gnu/libavcodec.so.54.71.100 /usr/lib/x86_64-linux-gnu/libavcodec.so.54
sudo rm -rf ~/spotify-libraries
#Dropbox

#Eclipse Atom
sudo apt-get install eclipse-cdt

#Telegram
sudo snap install telegram-sergiusens

#RedShift
sudo apt-get install redshift
sudo apt-get install geoclue-2.0

#Shutter
sudo apt-get install shutter

#TeamViewer

#Gnome
#paper theme Polar night Numix
apt-add-repository ppa:numix/ppa
apt-get update
apt-get install numix-icon-theme-circle

#Steam

#Wine
sudo apt-get install wine

#youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
sudo apt-get install -y libav-tools

#Add this to your bashrc and simply use download <URL> for mp3 format
function download()
{
youtube-dl -x --audio-format mp3 $@
}

#EasyTag
sudo apt-get install easytag

#always on top window - wmctrl -r :ACTIVE: -b toggle,above

#intel gfx drivers
sudo cp /etc/lsb-release /etc/lsb-release.backup
sudo  gedit /etc/lsb-release
#change code name to wily
sudo cp /etc/lsb-release.backup /etc/lsb-release

#TLP
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw

#WiFi drivers rtl
git clone http://github.com/lwfinger/rtlwifi_new.git
cd rtlwifi_new
make
sudo make install
echo "options rtl8723be fwlps=N ips=N" | sudo tee /etc/modprobe.d/rtl8723be.conf

#mouse acceleration
sudo cp 90-mouse.conf /usr/share/X11/xorg.conf.d/

#Ubuntu Tweak
wget http://archive.getdeb.net/ubuntu/pool/apps/u/ubuntu-tweak/ubuntu-tweak_0.8.7-1~getdeb2~xenial_all.deb
sudo apt-get install -f

#Qt5
sudo apt-get install qt5-default

#Sox
sudo apt-get install sox
sudo apt-get install libsox-fmt-mp3

#Pdf-chain
sudo add-apt-repository ppa:pdfchain-team/ppa
sudo apt-get update
sudo apt-get install pdfchain

#Arc Theme
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
sudo apt-get update
sudo apt-get install arc-theme

#Gprename
sudo apt-get install gprename

#Inkscape
sudo apt-get install inkscape
