# Proyecto Vagrant/docker

Este proyecto proporciona un entorno de desarrollo configurado con Vagrant levantando 3 docker para un app angular, back nodejs, y una base mongo. mediante un docker compose.

## Información del Curso

Este proyecto es para la actividad número 2 del curso "DevOps, Integración y Agilidad Continua".

### Miembros del Grupo

- Fernando Ismael Romero
- Rafael Arrieta
- Angel Ariel Montes
- Georgiy Strashko
- Marcelo Nicolas Waisman

## Requisitos

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/)

## Configuración

1. Clona este repositorio en tu máquina local:

    ```sh
    git clone https://github.com/fernandoromero91/utn-devops
    cd tu_repositorio
    ```
2. Cambia a la rama `unidad-2-docker`:

    ```sh
    git checkout unidad-2-docker
    ```

## Uso

1. Inicia la máquina virtual:

    ```sh
    vagrant up
    ```

1. Ingresa a la máquina virtual:

    ```sh
    vagrant ssh
    ```

1. Ir a la carpeta vagrant:

    ```sh
    cd /vagrant
    ```	

1. Correr el docker-compose:

    ```sh
    sudo docker-compose up --build -d
    ```	
2. Accede a la aplicación Angular en tu navegador web:

    ```
    http://localhost:8081
    ```

## Estructura del Proyecto

- `Vagrantfile`: Configuración de Vagrant para la máquina virtual.
- `setup.sh`: Script de aprovisionamiento para instalar dependencias y configurar el entorno.
- `Configs/devops.site.conf`: Archivo de configuración de Apache.
- `backend/dockerfile`: Archivo para configurar docker de back.
- `db/dockerfile`: Archivo para configurar docker de base mongo.
- `web/dockerfile`: Archivo para configurar docker de front web angular.

## Script de Aprovisionamiento

El script `setup.sh` realiza las siguientes tareas:

1. Eliminia instalaciones para la actividad 1.
2. Instala dependencias necesarias para docker.
3. Inicializa docker.


## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o envía un pull request con mejoras o correcciones.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para obtener más detalles.
