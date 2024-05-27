FROM node:lts

# Instalar herramientas necesarias
RUN apt-get update && apt-get install -y iputils-ping

WORKDIR /usr/src/app

# Clona el repositorio del backend
RUN git clone https://github.com/fernandoromero91/utn-devops-app-back.git /usr/src/app

WORKDIR /usr/src/app

# Instala las dependencias
RUN npm install

EXPOSE 3000
CMD ["node", "server.js"]
