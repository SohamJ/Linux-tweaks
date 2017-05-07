# Raspberry Pi Setup

## Static IP

Add the following in /etc/dhcpcd.conf

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
