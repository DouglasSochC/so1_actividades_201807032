#!/bin/bash
while true; do
    echo "¡Hola Douglas, Feliz dia!" | systemd-cat -p info
    fecha=$(date +'%d-%m-%Y %H:%M:%S')
    echo "Fecha y hora actual: $fecha" | systemd-cat -p info
    sleep 1
done