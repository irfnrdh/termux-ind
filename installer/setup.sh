#!/data/data/com.termux/files/usr/bash

# ==================================================================================================
# Installer Termux-Ind - Sebuah Installer Untuk Termux.
# Inspirasinya ada di issue (https://github.com/irfnrdh/termux-ind/)
# Copyright hanya milik Allah, kita mah bukan siapa2 (C) 05.02.23 @irfnrdh - Ruema Belajar
# Penggunaan : 
# pkg install wget 
# bash <(wget -qO- https://raw.githubusercontent.com/irfnrdh/termux-ind/main/installer/setup.sh )
# ==================================================================================================

## ANSI Colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"

reset_color() {
	printf '\033[37m'
}

## Script Termination
exit_on_signal_SIGINT() {
    { printf "${RED}\n\n%s\n\n" "[!] Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "${RED}\n\n%s\n\n" "[!] Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Letak Installer Folder
DEST="$HOME/termux-ind"

## Banner
banner() {
	clear
    cat <<- EOF
		${RED}┌──────────────────────────────────────────────────┐
		${RED}│${GREEN}░▀█▀░█▀▀░█▀▄░█▄█░█░█░█░█░░░░░▀█▀░█▀█░█▀▄░░${RED}│
		${RED}│${GREEN}░░█░░█▀▀░█▀▄░█░█░█░█░▄▀▄░▄▄▄░░█░░█░█░█░█░░${RED}│
		${RED}│${GREEN}░░▀░░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░░░░▀▀▀░▀░▀░▀▀░░░${RED}│
		${RED}└───────────────────────────────-──────────────────┘
        ${BLUE}By : Ruema Belajar // @irfnrdh
	EOF
}



	   
## Aplikasi Standar
LIST_OF_APPS_BIASA=(vim neovim htop fish)

	# Teks Editor (nano vim neovim micro emacs)
	# Hex Editor (hexdump od xxd hexcurse ired radare2)
	
## Aplikasi Untuk Development
LIST_OF_APPS_DEV=(bc bmon calc calcurse curl dbus elinks feh desktop-file-utils fontconfig-utils)

## Aplikasi untuk jadi Desktop X11-repo
LIST_OF_APPS_DESKTOP=(bc bmon calc calcurse curl dbus elinks feh desktop-file-utils fontconfig-utils \
       		      fsmon geany gtk2 gtk3 htop imagemagick jq leafpad man mpc mpd mutt ncmpcpp \
	   	      ncurses-utils neofetch otter-browser obconf openssl-tool polybar ranger rofi \
	   	      startup-notification termux-api pcmanfm tigervnc neovim wget xarchiver xbitmaps \
	   	      xfce4-terminal xmlstarlet audacious xorg-font-util xorg-xrdb zsh i3 picom which)

setup_biasa() {
	echo -e ${RED}"\n[*] Mulai install setup biasa..."
	echo -e ${CYAN}"\n[*] Termuxnya kita update dulu... \n"
	{ reset_color; pkg autoclean; pkg upgrade -y; }

	echo -e ${CYAN}"\n[*] Mulai install program... \n"
	for package in "${LIST_OF_APPS_BIASA[@]}"; do
		{ reset_color; pkg install -y "$package"; }
		_ipkg=$(pkg list-installed $package 2>/dev/null | tail -n 1)
		_checkpkg=${_ipkg%/*}
		if [[ "$_checkpkg" == "$package" ]]; then
			echo -e ${GREEN}"\n[*] Program $package Telah Terinstall.\n"
			continue
		else
			echo -e ${MAGENTA}"\n[!] Ada Error di Program $package, Gagal!..\n"
			{ reset_color; exit 1; }
		fi
	done
	reset_color
}
      
## Tampilkan Banner
usage() {
	banner
	setup_biasa
	## echo -e ${ORANGE}"\nTermux Installer"
	## echo -e ${ORANGE}"Usages : $(basename $0) --install | --uninstall | --termux-boot | --termux-boot-uninstall\n"
}
       

       
## Cek apakah foldernya ada
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

{ usage; setup_biasa; reset_color; exit 0; }

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



echo " Telah berhasil di install "


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



## Main




