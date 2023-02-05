#!/data/data/com.termux/files/usr/bash

###########################################################################################################
##  Installer Termux-Ind - Sebuah Installer Untuk Termux.						                         ##
##  Inspirasinya ada di issue (https://github.com/irfnrdh/termux-ind/)					                 ##
##  Copyright hanya milik Allah, kita mah bukan siapa2 (C) 05.02.23 @irfnrdh - Ruema Belajar		     ##
##  Penggunaan : 											                                             ##
##  - pkg install wget 											                                         ##
##  - bash <(wget -qO- https://raw.githubusercontent.com/irfnrdh/termux-ind/main/installer/setup.sh )	 ##
###########################################################################################################	

## ANSI Colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"

reset_color() {
	printf '\033[37m'
}

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

## Banner
banner() {
	clear
    cat <<- EOF
		${RED}┌────────────────────────────────────────────────────────┐
		${RED}│${GREEN}░▀█▀░█▀▀░█▀▄░█▄█░█░█░█░█░░░░░▀█▀░█▀█░█▀▄░░${RED}│
		${RED}│${GREEN}░░█░░█▀▀░█▀▄░█░█░█░█░▄▀▄░▄▄▄░░█░░█░█░█░█░░${RED}│
		${RED}│${GREEN}░░▀░░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░░░░▀▀▀░▀░▀░▀▀░░░${RED}│
		${RED}└────────────────────────────────────────────────────────┘
        ${BLUE}By : Ruema Belajar // @irfnrdh
	EOF
}

## Aplikasi Standar
_packageBiasa=(vim neovim htop fish)
_packageTextEditor=(nano vim neovim micro emacs)
_packageHexEditor=(hexdump od xxd hexcurse ired radare2)
	
## Aplikasi Untuk Development
_packageDevelopment=(bc bmon calc calcurse curl dbus elinks feh desktop-file-utils fontconfig-utils)

## Aplikasi untuk jadi Desktop X11-repo
_packageDesktop=(bc bmon calc calcurse curl dbus desktop-file-utils elinks feh fontconfig-utils fsmon \
		         geany git gtk2 gtk3 htop-legacy imagemagick jq leafpad man mpc mpd mutt ncmpcpp \
		         ncurses-utils neofetch otter-browser obconf openbox openssl-tool polybar ranger rofi \
		         startup-notification termux-api pcmanfm tigervnc vim wget xarchiver xbitmaps xcompmgr \
		         xfce4-settings xfce4-terminal xmlstarlet audacious xorg-font-util xorg-xrdb zsh i3 picom which)

## Letak Installer Folder
DEST="$HOME/termux-ind"

setup_biasa() {
	echo -e ${RED}"\n[*] Mulai install setup biasa..."
	echo -e ${CYAN}"\n[*] Termuxnya kita update dulu... \n"
	{ reset_color; pkg autoclean; pkg upgrade -y; }

	echo -e ${CYAN}"\n[*] Mulai install program... \n"
	for package in "${_packageBiasa[@]}"; do
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
             
       
## Cek apakah foldernya ada
cek_folder(){
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
}

# { usage; setup_biasa; reset_color; exit 0; }

# Informasi
cek_informasi(){
    echo "Ini adalah `uname -s` berjalan di `uname -m` processor."
    echo
    echo "Hari ini `date`, Minggu ke-`date +"%V"`."
    echo
    echo "Sistem ini sudah berjalan:"
    uptime
    echo
}

# # Mulai Install
# echo -e "\033[1;32m Kita akan mulai install... \033[0m"

# pkg install -y readline git

# echo -e "\033[1;32m Cloning Repositori Termux-Ind ... \033[0m"
# git clone --depth 1 https://github.com/irfnrdh/termux-ind "$DEST"

# echo $red 
# echo ""----------------------------------------------------------------------------- ""
# echo "Termux Installer"
# echo "---------------------------------------------------------------------------------"

# echo
# echo "."

# apt update -y  
# termux-setup-storage
# pkg install termux-api

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



#echo " Telah berhasil di install "


## Setup 

# cat > "$DEST/data/users.php" << XXXXX
# <?php
# /*|[{"username":"termux","password":"6558b496fb21c09603c5b28c998481ae075228ad","project":"\/data\/data\/com.termux\/files\/home\/"}]|*/
# ?>
# XXXXX

# chmod +x "$PREFIX/bin/ind" 
# echo -e "\033[1;32m Alhamdulillah Selesai! Cobain perintah 'ind'...  \033[0m"

# exit

config_base () {
    # Setup storage permissions.
    echo "Setting up required storage permissions."
    echo "Please grant termux storage permissions."
    termux-setup-storage
    sleep 2

    # Setup mirrors.
    echo "Please select/configure your default mirrors."
    sleep 2
    termux-change-repo

    # Update and upgrade termux, install termux-api package.
    echo "Updating and installing base packages."
    pkg update -y && pkg upgrade -y
    pkg install -y binutils build-essential curl git htop nano ncurses-utils openssh termux-api

    # Create and link user directories.
    mkdir "$HOME"/Desktop
    mkdir "$HOME"/Downloads
    mkdir "$HOME"/Templates
    mkdir "$HOME"/Public
    mkdir "$HOME"/Documents
    mkdir "$HOME"/Pictures
    mkdir "$HOME"/Videos
    mkdir "$HOME"/Music
    ln -s "$HOME"/storage/music/ "$HOME"/Music
    ln -s "$HOME"/storage/downloads/ "$HOME"/Downloads
    ln -s "$HOME"/storage/dcim/ "$HOME"/Pictures

    # Add custom PS1 to bashrc.
    echo "# Custom PS1 prompt." >> "$HOME"/.bashrc
    echo "export PS1=\"\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]: \[$(tput sgr0)\]\"" >> "$HOME"/.bashrc
}

config_minimal () {
    # Enable the tur-repository.
    pkg install -y tur-repo
    pkg update -y && pkg upgrade -y

    # Install minimal set of packages.
    pkg install -y micro code-server

    # Configuring Micro code editor and installing plugins.
    echo "Configuring Micro code editor and installing plugins."
    micro -plugin install autofmt detectindent filemanager manipulator quoter snippets

    # Set filemanager plugin to show by default.
    sed -i '/config.RegisterCommonOption("filemanager", "openonstart", false)/c\config.RegisterCommonOption("filemanager", "openonstart", true)' "$HOME"/.config/micro/plug/filemanager/filemanager.lua
}

config_desktop () {
    # Aktifkan X11 repository.
    echo "Kita aktifkan X11 repository untuk desktop mod."
    pkg install -y x11-repo
    pkg update -y && pkg upgrade -y

    # Install required dependencies
    echo "Kita pakai XFCE desktop and basic packages."
    pkg install -y code-oss firefox leafpad python python-tkinter xclip xfce4 xfce4-terminal
}

config_vnc () {
    # Mulai Update dan install tigervnc.
    pkg update -y && pkg upgrade -y
    pkg install -y tigervnc

    # Mulai Konfigurasi VNC server.
    echo "Mulai konfigurasi VNC server."
    echo "Ketika muncul VNC minta password, Password yang diketik tidak terlihat dan maksimal 8 karakter."
    vncserver -localhost
    echo "#!/data/data/com.termux/files/usr/bin/sh" > "$HOME"/.vnc/xstartup
    echo "xfce4-session &" >> "$HOME"/.vnc/xstartup
    echo "geometry=1920x1080" >> "$HOME"/.vnc/config
    echo "# VNC display variable." >> "$HOME"/.bashrc
    echo "export DISPLAY=\":1\"" >> "$HOME"/.bashrc
    vncserver -kill :1
}

config_xserver () {
    echo "Configuring Xserver."
    echo "# Xserver display variable." >> "$HOME"/.bashrc
    echo "export DISPLAY=localhost:0" >> "$HOME"/.bashrc
}


	# banner
	#  setup_biasa
	## echo -e ${ORANGE}"\nTermux Installer"
	## echo -e ${ORANGE}"Usages : $(basename $0) --install | --uninstall | --termux-boot | --termux-boot-uninstall\n"

## Main Menu
TERMINAL=$(tty)
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Termux-Ind"
TITLE="Installer"
MENU="Silahkan pilih yang kamu suka (selengkapnya ada didokumentasi Termux-Ind), gunakan panah atas bawah kiri kanan untuk navigasi dan tekan ENTER memilih pilihan:"

OPTIONS=(1 "Standart Mod (Minimal)"
         2 "Developer Mod"
         3 "Hacking Mod"
	     4 "Desktop Mod + VNC"
         5 "Desktop Mod + Xserver"
	     6 "Keluar")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \k
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >"$TERMINAL")

clear
case $CHOICE in
        1)
            clear
            echo "Mulai Installer \"Standart Mod\"."
            config_base
            config_minimal
            source "$HOME"/.bashrc
            clear
            echo "$MINIMAL_MSG"
            ;;
        2)
            clear
            echo "Starting \"Desktop (VNC)\" installation."
            config_base
            config_minimal
            config_desktop
            config_vnc
            source "$HOME"/.bashrc
            clear
            echo "$DESKTOP_VNC_MSG"
            ;;
        3)
            clear
            echo "Starting \"Desktop (Xserver)\" installation."
            config_base
            config_minimal
            config_desktop
            config_xserver
            source "$HOME"/.bashrc
            clear
            echo "$DESKTOP_XSERVER_MSG"
            ;;
	    4)
            clear
            exit
            ;;    
esac
