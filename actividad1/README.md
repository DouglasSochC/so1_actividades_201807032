# Tipos de Kernel

## Monolítico

Los núcleos monolíticos son el tipo más simple y común de núcleo. Incluyen la funcionalidad central del sistema operativo y admiten todos los dispositivos conectados a él. En este caso, los servicios de usuario y de núcleo se implementan en el mismo espacio de memoria. Debido a esto, el tamaño del núcleo aumenta, lo que a su vez incrementa el tamaño del sistema operativo. La principal ventaja es que la ejecución de procesos es más rápida al no haber un espacio de memoria separado para el usuario y el núcleo.

## Microkernel

Los núcleos microkernel son un desarrollo más reciente y, como tal, no son tan comunes como los núcleos monolíticos. Incluyen solo los servicios y dispositivos esenciales necesarios para que el sistema funcione. Esto resulta en un núcleo más pequeño que es más rápido y utiliza menos memoria. Aquí, los servicios de usuario y de núcleo se implementan en dos espacios diferentes: el Espacio de Usuario y el Espacio de Núcleo. Esto reduce el tamaño del núcleo y, por ende, el tamaño del sistema operativo.

## Híbrido

Los núcleos híbridos combinan características de los núcleos monolíticos y microkernels. Incluyen más servicios que los microkernels pero menos que los monolíticos. Esto les permite ofrecer algunos de los beneficios de ambos tipos de núcleos. Se benefician de la velocidad de los núcleos monolíticos y de la modularidad de los microkernels.

## Nano

Los núcleos nano son el tipo más pequeño de núcleo, constando de solo unas pocas miles de líneas de código. Esto significa que el código que se ejecuta en el modo privilegiado del hardware es mínimo. Se utilizan principalmente en sistemas integrados o dispositivos con recursos limitados.

## Exo

Este tipo de núcleo presenta protección y gestión de recursos por separado. Es adecuado para su uso cuando se realizan personalizaciones específicas de la aplicación. Los núcleos Exo están diseñados para dispositivos móviles y son una variación de los microkernels que incluyen características adicionales específicas para dispositivos móviles, como la gestión de energía y el soporte para múltiples procesadores.

## Diferencias

| Tipo de Núcleo    | Características Principales                                                | Ventajas                                                   | Desventajas                                                          |
|-------------------|------------------------------------------------------------------------|------------------------------------------------------------|----------------------------------------------------------------------|
| Monolítico        | Funcionalidad central y soporte para todos los dispositivos.         | Rápida ejecución de procesos.                             | Mayor tamaño del núcleo y, por ende, del sistema operativo.         |
| Microkernel       | Incluye solo servicios y dispositivos esenciales.                    | Núcleo más pequeño, rápido y uso eficiente de la memoria. | Menos común. Espacio de usuario y de núcleo en memoria separados.   |
| Híbrido           | Combina características de los monolíticos y microkernels.           | Ofrece beneficios de velocidad y modularidad.             | Menos velocidad que los monolíticos, mayor tamaño que los microkernels. |
| Nano              | El núcleo más pequeño, con solo unas pocas miles de líneas de código.| Ideal para sistemas integrados con recursos limitados.   | Limitado en funcionalidad para sistemas más complejos.             |
| Exo               | Protección y gestión de recursos por separado.                       | Adecuado para personalizaciones específicas.             | Diseñado específicamente para dispositivos móviles, no universal.   |

# User vs Kernel Mode

## User Mode

Cuando se inicia un programa en un sistema operativo, como Windows, se ejecuta en modo de usuario. Cuando un programa en modo de usuario solicita ejecutarse, Windows crea un proceso y un espacio de direcciones virtuales (espacio de direcciones para ese proceso). Los programas en modo de usuario tienen menos privilegios que las aplicaciones en modo kernel y no tienen permitido acceder directamente a los recursos del sistema. Por ejemplo, si una aplicación en modo de usuario desea acceder a recursos del sistema, primero debe pasar por el kernel del sistema operativo mediante el uso de syscalls.

## Kernel Mode

El kernel es el programa central en el que se basan todos los demás componentes del sistema operativo. Se utiliza para acceder a los componentes de hardware, programar qué procesos deben ejecutarse en un sistema informático y cuándo, y también gestiona la interacción entre el software de aplicación y el hardware. Por lo tanto, es el programa con más privilegios; a diferencia de otros programas, puede interactuar directamente con el hardware.

Cuando los programas en modo de usuario necesitan acceso al hardware, por ejemplo, una cámara web, primero deben pasar por el kernel mediante el uso de una syscall. Para llevar a cabo estas solicitudes, la CPU cambia de modo de usuario a modo kernel durante la ejecución. Después de completar la ejecución del proceso, la CPU vuelve a cambiar al modo de usuario.

## Comparativa

| Aspecto                   | Modo de Usuario                                        | Modo Kernel                                               |
|---------------------------|--------------------------------------------------------|-----------------------------------------------------------|
| **Privilegios**           | Menos privilegios, no puede acceder directamente a los recursos del sistema. | Máximos privilegios, puede interactuar directamente con el hardware. |
| **Creación de Procesos**  | Se crea un proceso y un espacio de direcciones virtuales para el programa. | Administra la ejecución de procesos y la interacción hardware-software. |
| **Acceso a Recursos**     | Necesita pasar por el kernel mediante syscalls para acceder a recursos del sistema. | Puede acceder directamente a los recursos del sistema.        |
| **Interruptores de Modo** | Cambia al modo kernel mediante syscalls cuando necesita acceder al hardware. | Cambia entre modos durante la ejecución del proceso.           |

# Interruptions vs Traps

## Trap

Las traps son generadas por el programa de usuario para invocar la funcionalidad del sistema operativo. Supongamos que la aplicación de usuario necesita imprimir algo en la pantalla; activaría una trap, y el sistema operativo escribiría los datos en la pantalla.

Esta puede ser causada por diversos factores, incluido un error en la instrucción, como la división por cero o el acceso ilegal a la memoria. También se puede generar una trap cuando un programa de usuario realiza una solicitud de servicio específica al sistema operativo. Las traps se denominan eventos síncronos porque la ejecución de las instrucciones actuales es más probable que cause traps. Las llamadas al sistema son otro tipo de trap en el que el programa solicita al sistema operativo buscar un servicio específico, y el sistema operativo genera posteriormente una interrupción para permitir que el programa acceda a los servicios.

## Interrupción

Las interrupciones son señales emitidas por software o hardware cuando un proceso o evento requiere atención inmediata. Debido a que tanto el hardware como el software generan estas señales, se les llama interrupciones de hardware y de software. Un dispositivo de hardware produce una interrupción, que puede ser causada por un dispositivo USB, una tarjeta de red (NIC) o un teclado. Las interrupciones ocurren de manera asíncrona y pueden suceder en cualquier momento.

### Comparativa

| Aspecto                 | trap                                         | Interrupción                                               |
|-------------------------|------------------------------------------------|------------------------------------------------------------|
| **Origen de la Señal**  | Generada por un programa de usuario para invocar una funcionalidad inmediata del sistema operativo. | Señal emitida a la CPU por hardware, indicando un evento que requiere atención inmediata. |
| **Activación** | Activa funcionalidad del SO y da control al manejador de traps. | Activa a la CPU para ejecutar la rutina de manejo de interrupciones. |
| **Proceso** | Sincrónica, puede ocurrir después de la ejecución de la instrucción. | Asincrónica, puede ocurrir en cualquier momento.          |
| **Generador**           | Generada por una instrucción de programa de usuario. | Puede ser generada por dispositivos de hardware y software. |

Referencias:

1. https://www.shiksha.com/online-courses/articles/kernel-and-its-types-operating-system/
2. https://www.linkedin.com/pulse/different-types-kernels-rajesh-gopalakrishnan/
3. https://isurushan.medium.com/operating-system-kernal-types-c60363fcda7c
4. https://learn.microsoft.com/en-us/windows-hardware/drivers/gettingstarted/user-mode-and-kernel-mode
5. https://www.geeksforgeeks.org/difference-between-user-mode-and-kernel-mode/
6. https://pages.cs.wisc.edu/~gerald/cs537/Summer17/handouts/traps.pdf
7. https://www.javatpoint.com/trap-vs-interrupt-in-operating-system#:~:text=The%20difference%20between%20a%20trap,the%20corresponding%20interrupt%20handler%20routine.
