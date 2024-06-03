#!/bin/bash

### Desinstalar el software de la práctica anterior ###
sudo apt-get remove --purge -y apache2 nodejs npm

### Actualizar los paquetes de la máquina virtual ###
sudo apt-get update

# Instalar Puppet Master y Puppet Agent
wget https://apt.puppet.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt-get update
sudo apt-get install -y puppetserver puppet-agent

# Crear usuario y grupo Puppet si no existen
if ! getent group puppet > /dev/null; then
  sudo groupadd puppet
fi

if ! id -u puppet > /dev/null 2>&1; then
  sudo useradd -g puppet puppet
fi

# Crear directorios de configuración de Puppet si no existen
sudo mkdir -p /etc/puppetlabs/code/environments/production/manifests
sudo mkdir -p /etc/puppetlabs/code/environments/production/modules/jenkins/manifests

# Transferir archivos de configuración de Puppet
sudo cp /vagrant/puppet/manifests/site.pp /etc/puppetlabs/code/environments/production/manifests/site.pp
sudo cp /vagrant/puppet/modules/jenkins/manifests/init.pp /etc/puppetlabs/code/environments/production/modules/jenkins/manifests/init.pp

# Agregar la clave GPG de Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA

# Instalar Java 11
sudo apt-get install -y openjdk-11-jdk

# Habilitar y arrancar el servicio de Puppet Server
sudo systemctl enable puppetserver
sudo systemctl start puppetserver

# Habilitar y arrancar el servicio de Puppet Agent
sudo systemctl enable puppet
sudo systemctl start puppet

# Instalar Jenkins utilizando Puppet
sudo /opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp


### Instalar dependencias necesarias para Docker ###
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-compose

### Configurar Swap ###
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

### Iniciar el servicio Docker ###
sudo systemctl start docker
sudo systemctl enable docker