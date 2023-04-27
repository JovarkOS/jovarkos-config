#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="jovarkos"
iso_publisher="JovarkOS <https://jovarkos.org>"
iso_application="JovarkOS Sway Live Installer"
iso_version="$(date +%Y.%m.%d)"
# Date format: YYY.MM.DD:HH:MM:SS
iso_label="jovarkos-$(date +%Y.%m.%d)-sway-x86_64.iso"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/share/wallpapers"]="0:0:755"
  ["/etc/skel"]="0:0:755"
)
