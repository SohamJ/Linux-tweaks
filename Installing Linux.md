_This guide is made for Ubuntu/Mint_

##### CREATING BOOTABLE USB #####

* Install/download unetbootin
* Download iso for the version/OS you want. Choose a 64 bit one, since 32 bit won't utilize ram >4 and its not compatible with efi (not to mention it being discontinued from support).
* Format the pendrive from a disk utility tool to a fat32 device.
* open unetbootin and select iso
* select drive as your pendrive (be careful, unetbootin formats the drive. Confirm device using disk utility or lsusb)
* install OS on the pendrive

##### DUAL BOOT SYSTEM #####

For a dual boot system (Winzzz being present on your computer already), you don't need an efi parition since Windoze comes with that. You'll need to:

Disable secure boot and fastboot in BIOS.

__If this installation is a fresh one, check below for efi partition setup__


##### SETUP #####

_For EFI:
Create a 200 mb Fat32 partition from a Live USB using Gparted.
Set the boot flag and mount boot to /boot/efi_

* Boot into the live USB
* Select the option to try Ubuntu before installing, just to see if the USB is setup correctly.
* Enter the setup, connect to wireless
* Do NOT enable updates during setup, it increases setup time.
* Enable 3rd party codecs
* On the screen asking you to install ubuntu alongside windows/over windows etc, choose something else (the last option)

##### Partitioning #####

The main part of the setup.

* You need 2 partitions mainly - OS and Swap. For a fresh install you'll need the efi partition as well.

* The OS can be installed entirely in 1 partition (easy and recommended for beginner use). This partition is the root or /. You need to make a ext4 partition of at least 20gb to house your OS, applications and data.

* This can be split into 3 partitions as well, if you plan to format the OS only and keep the data as is. In this, you need to set 3 partitions - root (/) or the OS, boot (/boot) or the kernel, and home (/home) or the user folder.

* Once the partition scheme is decided, mark the partition for format.

* Create the swap partition

* Install the bootloader in drive than the FS (/dev/sda than /dev/sda1). This is so that you can use grub to load all OS's on the drive and won't have to manually add an entry for Ubuntu in the mbr.

* That's it.. install and reboot. Remove the pendrive

__If there's any issue with the setup, boot into live usb and install the software boot-repair to solve issues with grub__
