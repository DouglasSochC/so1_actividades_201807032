#!/bin/bash

# Nombre del Named Pipe
PIPE=/tmp/chat_pipe

# Crear el Named Pipe si no existe
[ -p $PIPE ] || mkfifo $PIPE

# Función para manejar la señal de salida
cleanup() {
    rm -f $PIPE
    exit 0
}

trap cleanup EXIT

# Bucle principal para enviar y recibir mensajes
while true; do
    read -p "Tú: " mensaje
    echo "$mensaje" > $PIPE

    # Esperar a que el receptor responda
    respuesta=$(cat $PIPE)
    echo "Amigo: $respuesta"
done