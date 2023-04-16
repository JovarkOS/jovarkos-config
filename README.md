# Configuration files for reproducible JovarkOS builds

Each folder contains a set of configuration files for a specific build. The `archlive` folder contains the configuration files for the headless Arch Linux Live ISO. *Please note that this is a work in progress and is not yet ready for use.*

## Builds

All builds come with the following packages:

```bash
efibootmgr
amd-ucode
grub
intel-ucode
arch-install-scripts
archinstall
b43-fwcutter
base
bind-tools
brltty
broadcom-wl
clonezilla
cloud-init
crda
cryptsetup
diffutils
dmraid
edk2-shell
espeakup
grml-zsh-config
irssi
kitty-terminfo
lftp
libfido2
libusb-compat
linux-zen
linux-atm
linux-firmware
linux-firmware-marvell
livecd-sounds
mc
mdadm
memtest86+
mkinitcpio
mkinitcpio-archiso
mkinitcpio-nfs-utils
mtools
nbd
ndisc6
pcsclite
pv
qemu-guest-agent
refind
reflector
rxvt-unicode-terminfo
sg3_utils
smartmontools
sof-firmware
sudo
syslinux
terminus-font
tpm2-tss
udftools
usb_modeswitch
usbmuxd
usbutils
virtualbox-guest-utils-nox
xl2tpd
zsh

calamares
jovarkos-calamares-settings

boost-libs
cmake
efibootmgr
extra-cmake-modules
gcc
gtk-update-icon-cache
icu
kconfig
kcoreaddons
ki18n
kiconthemes
kio
kpmcore
libpwquality
partitionmanager
plasma-framework
polkit-qt5
python
qt5-svg
qt5-xmlpatterns
solid
squashfs-tools
yaml-cpp

lynx
vivaldi
vivaldi-ffmpeg-codecs
firefox

gparted
partclone
parted
partimage
lsscsi
fatresize
fsarchiver
nvme-cli
gptfdisk
gnu-netcat
gpart
gpm
ddrescue
lvm2
sdparm
testdisk
hdparm

exfatprogs
f2fs-tools
fatresize
fsarchiver
xfsprogs
btrfs-progs
reiserfsprogs
squashfs-tools
nfs-utils
nilfs-utils
ntfs-3g
dosfstools
e2fsprogs
exfatprogs
f2fs-tools
jfsutils

vlc
alacritty

git
curl
neofetch
exa
htop
bat
less
man-db
man-pages
rsync
screen
tmux

nano
vim

flatpak

cups
alsa-utils
fwupd
ufw

xorg-server
xf86-input-libinput
xf86-video-amdgpu
xf86-video-ati
xf86-video-vesa
xorg-xkill
xorg-xrdb

nmap
openconnect
openssh
openvpn
ppp
pptpclient
rp-pppoe
systemd-resolvconf
tcpdump
vpnc
wireless-regdb
wireless_tools
wpa_supplicant
wvdial
modemmanager
darkhttpd
dhclient
dhcpcd
dnsmasq
iw
iwd
ethtool

zsh-syntax-highlighting
zsh-autosuggestions
networkmanager
```

**Build specific packages**

GNOME:
```bash
gnome
gnome-tweaks
gdm
```

Cinnamon:

KDE Plasma:

i3:

Please see the `packages.x86_64` file in each folder for a full list of packages.

See [https://github.com/JovarkOS/jovarkos-jbuild/](https://github.com/jovarkos/jovarkos-jbuild/) for more details on buiding.
