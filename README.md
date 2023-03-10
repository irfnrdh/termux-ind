![Termux](TERMUX.jpg)

<div align="center">
  <h1>Termux Indonesia</h1>
  <p>All About Termux</p>
</div>

<br>
<br>    
  
> Filosofinya : Keterbatasan akan membuat kita lebih banyak belajar

## Kebutuhan 
- Tidak perlu di root untuk dapat bekerja
- Minimal Android 7+ 
- Menginstall VNC atau Xserver client untuk jadi desktop mod (bVNC or XserverXSDL)
- Termux di Install dari F-Droid
- TermuxAPI di Install dari F-Droid
> Termux di google play sudah tidak update lagi

## Penggunaan
Untuk memulai instalasi Termux-Ind dapat ikuti langkah-langkah berikut dibawah.
- `pkg update -y && pkg upgrade -y` 
- `pkg install wget`
- `wget https://raw.githubusercontent.com/irfnrdh/termux-ind/main/installer/setup.sh`
- `chmod +x setup.sh`
- `./setup.sh`

Cara install termux-ind dapat menggunakan beberapa perintah di terminal kamu dari  `curl`, `wget` atau lainnya yang sama.

| Method    | Command                                                                                           |
| :-------- | :------------------------------------------------------------------------------------------------ |
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/irfnrdh/termux-ind/main/installer/setup.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/irfnrdh/termux-ind/main/installer/setup.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/irfnrdh/termux-ind/main/installer/setup.sh)"` |

## Apa saja didalamnya?
- Installer 
  - Package Ngoding Mod
  - Package Hacking Mod
  - Package Desktop Mod
- Dotfiles Basic
- [Cheatsheet](Cheatsheets.md)
  - [Daftar Perintah di termux](https://github.com/irfnrdh/termux-ind/wiki/Perintah-di-Termux) 
- [Tutorial](Tutorial.md) (Mulai dari Newbie)
- [Panduan](https://termux.gitbook.io/)
- [Bookmark](Bookmarks.md)

## Testing Menggunakan
- Android 13 aarch64 
- CPU: MediaTek MT6765V/WB (8) @ 2.301GHz Helio P35 (12nm)  
       Octa-core (4x2.35 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53)
- GPU : PowerVR GE8320
- Internal : 64GB / 4GB RAM 
