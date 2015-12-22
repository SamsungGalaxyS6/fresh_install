#! /bin/bash +x

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
BWhite='\e[1;37m'       # White
Color_Off='\e[0m'       # Text Reset

# Add Repositories
echo -e "${BWhite}Adding repositories...${Color_Off}"
sudo add-apt-repository ppa:linrunner/tlp

# Get latest updates
echo -e "${BWhite}Updating system...${Color_Off}"
sudo apt-get update 

# Install applications
echo -e "${BWhite}Installing applications...${Color_Off}"
sudo apt-get install openjdk-7-jdk
sudo apt-get install bison g++-multilib git gperf libxml2-utils make python-networkx zlib1g-dev:i386 zip gcc-multilib g++ g++-4.8-multilib
sudo apt-get install android-tools-adb android-tools-fastboot
sudo apt-get install conky
sudo apt-get install -y tlp tlp-rdw tp-smapi-dkms acpi-call-tools

echo -e "${BWhite}Starting applications...${Color_Off}"
sudo tlp start

# System settings
echo -e "${BWhite}Modifying system settings...${Color_Off}"
echo -e "${Red}echo \"10\" > /proc/sys/vm/swappiness"
echo "echo \"noop\" > 1/sys/block/sda/queue/scheduler"
echo -e "echo \"256\" > /sys/block/sda/queue/read_ahead_kb${Color_Off}"
read -p "Copy the settings and then press [Enter]..."
sudo nano /etc/rc.local

echo -e "${BWhite}Upgrading...${Color_Off}"
sudo apt-get upgrade

echo -e "${BWhite}Autoremoving items...${Color_Off}"
sudo apt-get autoremove

echo -e "${BWhite}Setup git...${Color_Off}"
git config --global user.email "mtb3000gt@gmail.com"
git config --global user.name "Tony Malagisi"
