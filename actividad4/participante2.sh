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

# Bucle principal para recibir mensajes y responder
while true; do
    mensaje=$(cat $PIPE)
    echo "Amigo: $mensaje"

    read -p "Tú: " respuesta
    echo "$respuesta" > $PIPE
done