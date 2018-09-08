# Install Spotify on Linux

## Install test version

```bash
# Import test repository
echo deb http://repository.spotify.com testing non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Install Spotify
sudo apt-get install spotify-client-0.9.17
```

## Include additional packages/libraries for offline support

```bash
# Install additional packages
sudo apt install -y \
  ubuntu-restricted-extras \
  ffmpeg libavcodec-extra \
  libavcodec-extra57 \
  libavutil55 \
  libavformat57 \
  zenity

# Clone additional libraries
git clone https://github.com/ramedeiros/spotify_libraries.git

# Copy libraries
cd spotify_libraries && sudo cp lib* /usr/lib/x86_64-linux-gnu/

# Execute ldconfig
sudo ldconfig

# Link broken symlinks
sudo ln -frs /usr/lib/x86_64-linux-gnu/libavutil.so.52.6.100 /usr/lib/x86_64-linux-gnu/libavutil.so.52
sudo ln -frs /usr/lib/x86_64-linux-gnu/libavformat.so.54.36.100 /usr/lib/x86_64-linux-gnu/libavformat.so.54
sudo ln -frs /usr/lib/x86_64-linux-gnu/libavcodec.so.54.71.100 /usr/lib/x86_64-linux-gnu/libavcodec.so.54j
```
