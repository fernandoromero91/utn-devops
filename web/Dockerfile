# Usar la versión LTS de Node.js
FROM node:18.13 as build

WORKDIR /app

# Clona el repositorio de la aplicación Angular
RUN git clone --branch unidad-2-docker https://github.com/fernandoromero91/utn-devops-app.git /app

WORKDIR /app

# Instala las dependencias y construye la aplicación Angular
RUN npm install
RUN npm run build

# Instala NGINX y copia los archivos construidos
FROM nginx:alpine
COPY --from=0 /app/dist/utn-devops-app/browser /usr/share/nginx/html
# Copia la configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
