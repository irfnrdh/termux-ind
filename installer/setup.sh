#!/data/data/com.termux/files/usr/bash
echo $red 
echo ""----------------------------------------------------------------------------- ""
echo "Termux Installer"
echo "---------------------------------------------------------------------------------"

echo
echo "."

apt update -y                   

# Git
pkg install git -y
git config --global credential.helper store
git config --global user.email "..."
git config --global user.name "..."

# Essentials
pkg install vim
pkg install nvim
pkg install htop


   
apt install python -y           
apt install python2 -y
apt install ruby -y 

apt install php -y 
apt install perl -y
apt install nmap -y

apt install bash -y
apt install clang -y
apt install jq -y
apt install macchanger -y

apt install nano -y
apt install curl -y
apt install tar -y
apt install zip -y

apt install unzip -y
apt install tor -y
apt install wget -y

apt install wcalc -y 
apt install openssl
apt install bmon -y


echo " Telah berhasil di install "

exit

