# Dockerfile con varias malas prácticas para que SonarQube las detecte

FROM ubuntu:latest

# Uso de root por defecto (mala práctica)
USER root

# Instalación de paquetes sin limpiar la cache (mala práctica)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl

# Copiar archivos sin especificar .dockerignore (potencial fuga de secretos)
COPY . /app

# Uso de ADD en vez de COPY (ADD tiene comportamientos inesperados)
ADD https://example.com/file.txt /app/file.txt

# Exponer puertos innecesarios
EXPOSE 22
EXPOSE 8080

# No especificar HEALTHCHECK
# No usar versiones fijas de paquetes (puede causar builds no reproducibles)
RUN pip3 install flask
RUN pip3 install requests
RUN pip3 install numpy
RUN pip3 install pandas

# Comando con shell form (puede causar problemas de señal)
CMD python3 /app/app.py