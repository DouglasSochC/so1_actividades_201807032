#!/bin/bash

# Lee la variable GITHUB_USER
read -p "Escriba el nombre de usuario: " GITHUB_USER

# Variable que almacena la informacion del usuario cuando se realiza una consulta
USUARIO=$(curl -s https://api.github.com/users/${GITHUB_USER})

# Se crean variables que almacenan la informacion requerida
USUARIO_GIT=$(echo ${USUARIO} | jq -r .login)
ID_GIT=$(echo ${USUARIO} | jq -r .id)
FECHA_CREACION_GIT=$(echo ${USUARIO} | jq -r .created_at)

# Variable para el mensaje
MENSAJE="Hola ${USUARIO_GIT}. User ID: ${ID_GIT}. Cuenta fue creada el: ${FECHA_CREACION_GIT}."

# Se imprime el mensaje
echo ${MENSAJE}

# Se obtiene la fecha actual
FECHA_ACTUAL=$(date '+%Y-%m-%d')

# Crear el directorio si no existe
mkdir -p /tmp/${FECHA_ACTUAL}

# Se crea un archivo log con el mensaje
echo ${MENSAJE} > /tmp/${FECHA_ACTUAL}/saludos.log

# Proceso de creacion de contrab para que ejecute el comando cada 5 minutos.
# 1. Se edita el archivo contrab con el siguiente comando
# contrab -e
# 2. Se crea una linea nueva en la parte final del archivo, y se agrega lo siguiente:
# */5 * * * * /home/douglas/usac_so1/actividad2.sh
# 3. Se guarda y cierra el archivo.
