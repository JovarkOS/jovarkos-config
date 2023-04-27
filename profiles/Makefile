.PHONY: all

all: global_packages.x86_64 worker.sh
	@bash worker.sh

cinnamon: global_packages.x86_64
	@bash worker.sh cinnamon

console: global_packages.x86_64
	@bash worker.sh console

gnome: global_packages.x86_64
	@bash worker.sh gnome

i3: global_packages.x86_64
	@bash worker.sh i3

kde: global_packages.x86_64
	@bash worker.sh kde

lxqt: global_packages.x86_64
	@bash worker.sh lxqt

mate: global_packages.x86_64
	@bash worker.sh mate

pantheon: global_packages.x86_64
	@bash worker.sh pantheon

sway: global_packages.x86_64
	@bash worker.sh sway

xfce: global_packages.x86_64
	@bash worker.sh xfce

install : all
	sudo cp -r console /usr/share/archiso/configs/
	sudo cp -r gnome /usr/share/archiso/configs/
	sudo cp -r i3 /usr/share/archiso/configs/
	sudo cp -r kde /usr/share/archiso/configs/
	sudo cp -r lxqt /usr/share/archiso/configs/
	sudo cp -r mate /usr/share/archiso/configs/
	sudo cp -r pantheon /usr/share/archiso/configs/
	sudo cp -r sway /usr/share/archiso/configs/
	sudo cp -r xfce /usr/share/archiso/configs/
	sudo cp -r cinnamon /usr/share/archiso/configs/


