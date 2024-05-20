# Proyecto Vagrant con Angular y Apache

Este proyecto proporciona un entorno de desarrollo configurado con Vagrant para una aplicación Angular servida mediante Apache.

## Información del Curso

Este proyecto es para la actividad número 1 del curso "DevOps, Integración y Agilidad Continua".

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
2. Cambia a la rama `unidad-1-vagrant`:

    ```sh
    git checkout unidad-1-vagrant
    ```

## Uso

1. Inicia la máquina virtual:

    ```sh
    vagrant up
    ```

2. Accede a la aplicación Angular en tu navegador web:

    ```
    http://localhost:8080
    ```

## Estructura del Proyecto

- `Vagrantfile`: Configuración de Vagrant para la máquina virtual.
- `setup.sh`: Script de aprovisionamiento para instalar dependencias y configurar el entorno.
- `Configs/devops.site.conf`: Archivo de configuración de Apache.

## Script de Aprovisionamiento

El script `setup.sh` realiza las siguientes tareas:

1. Actualiza los paquetes y dependencias necesarias.
2. Instala Node.js, npm y Apache.
3. Configura Apache para servir la aplicación Angular.
4. Clona el repositorio de la aplicación Angular y construye el proyecto.


## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o envía un pull request con mejoras o correcciones.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para obtener más detalles.
