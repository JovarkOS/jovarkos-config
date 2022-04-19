#!/bin/bash
set -e --used -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
usermod -s /usr/bin/zsh root
git clone https://github.com/ohmyzsh/ohmyzsh.git /etc/skel/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /etc/skel/.oh-my-zsh/custom/themes/powerlevel10k
# Copy files from /etc/skel to /root
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
systemctl enable NetworkManager.service
# Move .zshrc.new (named other than .zshrc to not conflict with package install) to .zshrc 
mv /etc/skel/.zshrc.new /etc/skel/.zshrc
# Add sudo user to sudoers file
echo "liveuser ALL=(ALL:ALL) ALL" >> /etc/sudoers
useradd -m -G wheel liveuser
# Add unixtime as password for live user (but immediately expire it for resetting on next login) so we can use sudo
echo $(date +%S) | passwd -e liveuser
# This next step is the most important: it will permit us to "pause" the mkarchiso process and customize it regarding our needs.
su liveuser
systemctl --user enable ulauncher.service
pacman -Sy
pacman-key --init
pacman-key --populate archlinux
# Set GNOME themes and icons
gsettings set org.gnome.desktop.interface gtk-theme "JovarkOS"
gsettings set org.gnome.desktop.interface icon-theme "JovarkOS"
# Run a shell, use exit to continue 