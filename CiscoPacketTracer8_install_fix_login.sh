#!/bin/bash

#Variables
dir_app=~/PacketTracer
package_name="*PacketTracer_*64bit.deb"
url_pt="https://www.netacad.com/portal/resources/packet-tracer"

#Funciones
verificar_instalador(){
	if [ -f $package_name ];
	then 
		#Si no existe el directorio se copia y cambia el nombre del deb
		if [ -d $dir_app  ]; then sudo rm -rf $dir_app/* ; else mkdir $dir_app ; fi
	else 
		xdg-open $url_pt || firefox $url_pt
		read -rsp $'After download deb version, press enter to continue...\n'
		if [ -f $package_name ];then verificar_instalador; else exit 2;fi
	fi
}

#MAIN
verificar_instalador

#Eliminar Instalación anterior
sudo rm -rf /opt/pt/
sudo rm -rf /usr/share/applications/cisco*pt.desktop
sudo rm -rf /usr/share/applications/cisco*ptsa.desktop


# Extract debian image using the 'ar' command
ar -xv $package_name --output=$dir_app
cd $dir_app

mkdir control 	&& tar -C control -Jxf control.tar.xz
mkdir data 	&& tar -C data -Jxf data.tar.xz

source /etc/os-release #Source carga funciones, variables y archivos de configuración de otro archivo
if [[ $VERSION_ID -eq 35 ]] #Version de fedora a parchear
then
	echo "Parcheando PT8 -> Fedora 35"
	sudo sed -i 's|Exec=/opt/pt/packettracer|Exec=/opt/pt/packettracer --no-sandbox args|g' data/usr/share/applications/cisco-pt.desktop
	sudo sed -i 's|Exec=/opt/pt/packettracer|Exec=/opt/pt/packettracer --no-sandbox args|g' data/usr/share/applications/cisco-ptsa.desktop
fi

sudo cp -r data/usr /
sudo cp -r data/opt /
sudo rm control.tar.xz data.tar.xz

# update icon and file assocation
sudo xdg-desktop-menu install /usr/share/applications/cisco-pt.desktop
sudo xdg-desktop-menu install /usr/share/applications/cisco-ptsa.desktop
sudo update-mime-database /usr/share/mime
sudo gtk-update-icon-cache --force --ignore-theme-index /usr/share/icons/gnome
     xdg-mime default cisco-ptsa.desktop x-scheme-handler/pttp
sudo ln -sf /opt/pt/PacketTracer /usr/local/bin/PacketTracer
