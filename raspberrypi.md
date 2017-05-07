# Raspberry Pi Setup

## Static IP

* Add the following in /etc/dhcpcd.conf:
* You can use a different ip config as well

	```bash
	interface wlan0
	static ip_address=192.168.0.10/24
	static routers=192.168.0.1
	static domain_name_servers=192.168.0.1
	```

### Backup/Restore SD

* Backup:

 * use lsblk to check the SD card disk name(/dev/mmcblk0 here)
   ```bash
	 sudo dd if=/dev/mmcblk0 of=~/SDCardBackup.img
	 ```

* Restore:

 * Unmount all partitions of the SD card

	 ```bash
   sudo dd bs=4M if=~/SDCardBackup.img of=/dev/mmcblk0
   sudo sync
   ```

### Docker

* Installation:
	```bash
	curl -sSL get.docker.com | sh
	```

* Run Docker as non-root user(default user:pi):
	```bash
	sudo usermod -aG docker pi
	newgrp docker
	```

* Enable docker at startup:
	```bash
	sudo systemctl enable docker
	sudo systemctl start docker
	```
