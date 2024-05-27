#!/bin/bash

### Desinstalar el software de la práctica anterior ###
sudo apt-get remove --purge -y apache2 nodejs npm

### Actualizar los paquetes de la máquina virtual ###
sudo apt-get update

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