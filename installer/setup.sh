#!/data/data/com.termux/files/usr/bash

# ==================================================================================================
# Installer Termux-Ind - Sebuah Installer Untuk Termux.
# Copyright hanya milik Allah, kita mah bukan siapa2 (C) 05.02.23 @irfnrdh - Ruema Belajar
# Penggunaan : 
# bash <(wget -qO- https://raw.githubusercontent.com/irfnrdh/termux-ind/main/installer/setup.sh )
# ==================================================================================================

# Letak Installer Folder
DEST="$HOME/termux-ind"

# Cek apakah foldernya ada
if [ -e "$DEST" ]
then
    echo -en "\033[1;31m" 
    read -p " Sepertinya folder $DEST Dah ada, Tekan huruf 'y' untuk kita hapus! " -n 1 -r
    echo -e "\033[0m"
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm -rf "$DEST"
    else
        echo -e "\033[1;31m Gagal ! \033[0m" 
        exit 1
    fi
fi

# Informasi
echo "Ini adalah `uname -s` berjalan di `uname -m` processor."
echo
echo "Hari ini `date`, Minggu ke-`date +"%V"`."
echo
echo "Sistem ini sudah berjalan:"
uptime
echo


# Mulai Install
echo -e "\033[1;32m Kita akan mulai install... \033[0m"

pkg install -y readline git

echo -e "\033[1;32m Cloning Repositori Termux-Ind ... \033[0m"
git clone --depth 1 https://github.com/irfnrdh/termux-ind "$DEST"

echo $red 
echo ""----------------------------------------------------------------------------- ""
echo "Termux Installer"
echo "---------------------------------------------------------------------------------"

echo
echo "."

apt update -y  
termux-setup-storage
pkg install termux-api

# Backup
# tar -zcf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr
# ----
# termux-backup /sdcard/backup.tar.xz (alternatif pakai termux-backup)
# termux-backup - | gpg --symmetric --output /sdcard/backup.tar.gpg (pakai gpg)

# Restore
# tar -zxf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files --recursive-unlink --preserve-permissions
# ----
# termux-restore /sdcard/backup.tar.xz (Alternatif pakai termux-restore)
# export GPG_TTY=$(tty)
# gpg --decrypt /sdcard/backup.tar.gz.gpg | gunzip | termux-restore -


# Git
# pkg install git -y
# git config --global credential.helper store
# git config --global user.email "..."
# git config --global user.name "..."

# Essentials
pkg install vim
pkg install nvim
pkg install htop


# apt install python -y           
# apt install python2 -y
# apt install ruby -y 

# apt install php -y 
# apt install perl -y
# apt install nmap -y

# apt install bash -y
# apt install clang -y
# apt install jq -y
# apt install macchanger -y

# apt install nano -y
# apt install curl -y
# apt install tar -y
# apt install zip -y

# apt install unzip -y
# apt install tor -y
# apt install wget -y

# apt install wcalc -y 
# apt install openssl
# apt install bmon -y


echo " Telah berhasil di install "

# pkg install fish

## Hex Editor
## hexdump, od and xxd
# pkg install hexcurse # https://github.com/LonnyGomes/hexcurse
# pkg install ired     # https://github.com/radare/ired
# pkg install radare2  # https://rada.re


## Text Editor

# pkg install nano
# pkg install vim
# pkg install neovim
# pkg install micro
# pkg install emacs



## Setup 

# cat > "$DEST/data/users.php" << XXXXX
# <?php
# /*|[{"username":"termux","password":"6558b496fb21c09603c5b28c998481ae075228ad","project":"\/data\/data\/com.termux\/files\/home\/"}]|*/
# ?>
# XXXXX


# chmod +x "$PREFIX/bin/ind" 
echo -e "\033[1;32m Alhamdulillah Selesai! Cobain perintah 'ind'...  \033[0m"

# exit



# $HOME (/data/data/com.termux/files/home)
# $PREFIX (/data/data/com.termux/files/usr)
