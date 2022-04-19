#!/bin/bash
set -e --used -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root
sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf
sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf
systemctl enable pacman-init.service choose-mirror.service
systemctl set-default multi-user.target
systemctl enable gdm.service
nano /etc/sudoers
useradd -m -G wheel liveuser
# Do not forget to add a password, otherwise you will not be able to access sudo later.
passwd liveuser
# This next step is the most important: it will permit us to "pause" the mkarchiso process and customize it regarding our needs.
su liveuser
systemctl --user enable ulauncher.service
pacman -Sy
pacman-key --init
pacman-key --populate archlinux
gsettings set org.gnome.desktop.interface gtk-theme "JovarkOS"
gsettings set org.gnome.desktop.interface icon-theme "JovarkOS"
# Run a shell, use exit to continue 
