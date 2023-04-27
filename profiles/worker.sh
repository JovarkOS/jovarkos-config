#!/bin/env bash

if [ $# -eq 0 ]; then
	for file in $(ls {cinnamon,console,gnome,i3,kde,lxqt,mate,pantheon,sway,xfce}/packages.x86_64);
		do 
			cat global_packages.x86_64 >> "$file" 
			sort -u -o "$file" "$file" 
			sed -i '/^#/d' "$file" 
			sed -i '/^$/d' "$file"
			echo "Packages added to $file"
		done
	exit 
else 
	file="$1/packages.x86_64"
	cat global_packages.x86_64 >> "$file" 
	sort -u -o "$file" "$file" 
	sed -i '/^#/d' "$file" 
	sed -i '/^$/d' "$file"
	echo "Packages added to $file"
fi
