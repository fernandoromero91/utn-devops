#!/bin/bash

### Aprovisionamiento de software ###

# Actualizo los paquetes de la maquina virtual
sudo apt-get update

# Instalo dependencias necesarias para NodeSource
sudo apt-get install -y ca-certificates curl gnupg

# Agrego la clave GPG de NodeSource y el repositorio para Node.js v20.x
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Instalo Node.js y npm
sudo apt update
sudo apt install -y nodejs

# Instalo un servidor web y otras dependencias necesarias
sudo apt-get install -y apache2 apache2-utils git

### Configuración del entorno ###

## Genero una partición swap. Previene errores de falta de memoria
if [ ! -f "/swapdir/swapfile" ]; then
    sudo mkdir /swapdir
    cd /swapdir
    sudo dd if=/dev/zero of=/swapdir/swapfile bs=1024 count=2000000
    sudo chmod 0600 /swapdir/swapfile
    sudo mkswap -f  /swapdir/swapfile
    sudo swapon swapfile
    echo "/swapdir/swapfile       none    swap    sw      0       0" | sudo tee -a /etc/fstab
    sudo sysctl vm.swappiness=10
    echo vm.swappiness=10 | sudo tee -a /etc/sysctl.conf
fi

## configuración servidor web
# Aseguro que el directorio exista
sudo mkdir -p /etc/apache2/sites-available
#copio el archivo de configuración del repositorio en la configuración del servidor web
if [ -f "/tmp/devops.site.conf" ]; then
	echo "Copio el archivo de configuracion de apache"
	sudo mv /tmp/devops.site.conf /etc/apache2/sites-available
	#activo el nuevo sitio web
	sudo a2ensite devops.site.conf
	#desactivo el default
	sudo a2dissite 000-default.conf
	#refresco el servicio del servidor web para que tome la nueva configuración
	sudo service apache2 reload
fi

## Aplicación
# Ruta raíz del servidor web
APACHE_ROOT="/var/www"
# Ruta de la aplicación
APP_PATH="$APACHE_ROOT/utn-devops-app"

if [ ! -d "$APACHE_ROOT" ]; then
    sudo mkdir -p $APACHE_ROOT
fi

# Descargar y construir la aplicación Angular desde el repositorio
if [ ! -d "$APP_PATH" ]; then
    echo "Clonando y construyendo la aplicación Angular"
    cd $APACHE_ROOT
    sudo git clone https://github.com/fernandoromero91/utn-devops-app.git
    cd utn-devops-app
    sudo npm install
    sudo npx ng build --configuration=production
    sudo cp -r dist/utn-devops-app/browser/* $APP_PATH
fi

