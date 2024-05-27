# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/jammy64"
  # Configuración del nombre de la máquina
  config.vm.hostname = "utn-devops.localhost"
  # Redireccionamiento de puertos
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 27017, host: 27017
  # Permite descargas con certificados vencidos o por http
  config.vm.box_download_insecure = true
  
  # Configurar la cantidad de memoria RAM de la VM para el proveedor VirtualBox
  config.vm.provider "virtualbox" do |v|
    v.name = "utn-devops-vagrant-ubuntu"
    v.memory = "2048"
  end

  # Mapeo de directorios entre la máquina virtual y el host
  config.vm.synced_folder ".", "/vagrant"
  
  # Copia el archivo de configuración del servidor web desde la máquina host a la VM
  config.vm.provision "file", source: "Configs/devops.site.conf", destination: "/tmp/devops.site.conf"
  # Aprovisionamiento de la máquina virtual
  config.vm.provision :shell, path: "setup.sh", run: "always"
  

end
