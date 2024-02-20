**Nombre:** Douglas Alexander Soch Catalán
**Carnet:** 201807032

# Proceso de instalación del servicio

### 1. Script y ubicación

Se ha definido un script (ubicado en la parte inferior) en el cual se deberá guardar en la siguiente ruta: `/usr/local/bin/`

[SCRIPT](actividad3.sh)

### 2. Permisos de ejecución al script

Se le da permisos de ejecución al script.

```bash
sudo chmod 750 /usr/local/bin/actividad3.sh
```

### 3. Servicio y ubicación

Se ha definido un servicio (ubicado en la parte inferior) en el cual se deberá guardar en la siguiente ruta: `/etc/systemd/system/`

[SERVICIO](actividad3.service)

Este se encargará de realizar la ejecuión del script que se ha definido previamente.

### 4. Inicializar el servicio

Después de haber realizado los pasos previos el servicio se inicia de la siguiente forma

* 4.1: Verificar que el servicio no esté en ejecución.

```bash
sudo systemctl status actividad3
```

* 4.2: Iniciar el servicio.
```
sudo systemctl start actividad3
```

* 4.3: Confirmar que el servicio se esté ejecutando correctamente.
```bash
sudo systemctl status actividad3
```

Al ejecutar el comando anterior se obtendrá la siguiente salida, el cual, confirma que todo esta ejecutandose correctamente.

```bash
douglas@Douglas:~$ sudo systemctl status actividad3
● actividad3.service - Actividad 3 - Sistemas Operativos 1 - 201807032
     Loaded: loaded (/etc/systemd/system/actividad3.service; disabled; vendor preset: enabled)
     Active: active (running) since Tue 2024-02-20 15:46:15 CST; 36s ago
   Main PID: 1629 (actividad3.sh)
      Tasks: 2 (limit: 2282)
     Memory: 572.0K
     CGroup: /system.slice/actividad3.service
             ├─1629 /bin/bash /usr/local/bin/actividad3.sh
             └─1865 sleep 1

Feb 20 15:46:15 Douglas systemd[1]: Started Actividad 3 - Sistemas Operativos 1 - 201807032.
Feb 20 15:46:15 Douglas cat[1631]: ¡Hola Douglas, Feliz dia!
Feb 20 15:46:33 Douglas cat[1743]: ¡Hola Douglas, Feliz dia!
Feb 20 15:46:34 Douglas cat[1751]: ¡Hola Douglas, Feliz dia!
Feb 20 15:46:43 Douglas cat[1816]: Fecha y hora actual: 20-02-2024 15:46:43
Feb 20 15:46:49 Douglas cat[1852]: Fecha y hora actual: 20-02-2024 15:46:49
```