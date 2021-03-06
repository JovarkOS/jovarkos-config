#!/bin/bash
set -e --used -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
usermod -s /usr/bin/zsh root

# Add cli configuration to skeleton user directory
git clone https://github.com/ohmyzsh/ohmyzsh.git /etc/skel/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /etc/skel/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions /etc/skel/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /etc/skel/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Copy files from /etc/skel to /root
cp -aT /etc/skel/ /root/
chmod 700 /root
sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf
sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

# Enable services
sudo systemctl enable pacman-init.service choose-mirror.service
sudo systemctl set-default graphical.target
sudo systemctl enable gdm.service
ln -sf /usr/lib/systemd/system/gdm.service /etc/systemd/system/display-manager.service
ln -sf /usr/lib/systemd/system/graphical.target /usr/lib/systemd/system/default.target

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager


# Rename config.rename files (.rename appended so as to not conflict with package install) 
mv /etc/skel/.zshrc.rename /etc/skel/.zshrc
mv /etc/xdg/user-dirs.defaults.rename mv /etc/xdg/user-dirs.defaults
mv /etc/sudo.conf.rename /etc/sudo.conf
mv /etc/sudoers.rename /etc/sudoers
mv /etc/skel/.xinitrc.rename /etc/skel/.xinitrc

# Add sudo user to sudoers file
# echo "liveuser ALL=(ALL:ALL) ALL" >> /etc/sudoers
# Add user to wheel and nopasswdlogin groups
useradd -m -G wheel liveuser nopasswdlogin
mkdir -p /home/liveuser/
cp -aT /etc/skel/ /home/liveuser/
chown -R liveuser:liveuser /home/liveuser/
usermod -s /usr/bin/zsh liveuser

# Add standardized password for live user so we can use sudo
(echo 'jovarkos'; echo 'jovarkos') | passwd liveuser

# This next step is the most important: it will permit us to "pause" the mkarchiso process and customize it regarding our needs.
su liveuser
systemctl --user enable ulauncher.service
systemctl enable gdm.service
pacman -Sy
pacman-key --init
pacman-key --populate archlinux
# Set GNOME themes and icons
gsettings set org.gnome.desktop.interface gtk-theme "JovarkOS"
gsettings set org.gnome.desktop.interface icon-theme "JovarkOS"
# Exit liveuser session
exit
# Expire liveuser password for resetting on next login 
# (don't do this above so the chroot doesn't get forced to update the password)
# Also doesn't offend our users across the pond (https://bills.parliament.uk/bills/3069)
passwd -e liveuser
