#!/bin/sh
# Check if root
if [ "$(whoami)" != "root" ]; then
  whiptail --msgbox "Sorry you are not root. You must type: sudo sh install.sh" $WT_HEIGHT $WT_WIDTH
  exit
fi

# Check if raspi-config is installed
if [ $(dpkg-query -W -f='${Status}' raspi-config 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
  whiptail --msgbox "Raspi-config is already installed, try upgrading it within raspi-config..." 10 >else
  wget https://archive.raspberrypi.org/debian/pool/main/r/raspi-config/raspi-config_20241202_all.deb>  apt-get install libnewt0.52 whiptail parted triggerhappy lua5.1 alsa-utils -y
  # Auto install dependancies on eg. ubuntu server on RPI
  apt-get install -fy
  dpkg -i /tmp/raspi-config_20241202_all.deb
  whiptail --msgbox "Raspi-config is now installed, run it by typing: sudo raspi-config" 10 60
fi

exit

