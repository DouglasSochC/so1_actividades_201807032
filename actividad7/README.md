# Completely Fair Scheduler

El Planificador Completamente Justo (Completely Fair Scheduler - CFS) es un algoritmo planificador desarrollado con la meta de maximizar el uso de la CPU con las diferentes tareas que se lanzan en un sistema Linux basándose en el Fair Queuing.

## Funcionamiento

El funcionamiento del Completely Fair Scheduler (CFS) de Linux se basa en asignar a cada proceso un tiempo de CPU virtual que refleja su uso real de los recursos, organizándolos en una cola de planificación ordenada por este tiempo virtual. Cuando el sistema necesita seleccionar el próximo proceso a ejecutar, elige aquel con el tiempo de CPU virtual más bajo, asegurando así una asignación justa y equitativa de la CPU. Este tiempo de CPU virtual se actualiza dinámicamente mientras los procesos se ejecutan o esperan, garantizando que todos los procesos tengan la oportunidad de ejecutarse de manera equitativa y eficiente.

## Características principales

* **Justicia y equidad**: El CFS busca ofrecer una distribución justa de tiempo de CPU a todos los procesos en ejecución, independientemente de su carga o prioridad.

* **Modelo de planificación basado en prioridades dinámicas**: A diferencia de otros algoritmos de planificación que asignan prioridades fijas a los procesos, el CFS utiliza un modelo de prioridades dinámicas basado en el tiempo de CPU virtual de cada proceso. Esto permite una adaptación eficiente a la carga del sistema y a las necesidades de los procesos en ejecución.

* **Tiempo de CPU virtual**: El CFS utiliza el tiempo de CPU virtual para calcular la prioridad de cada proceso en la cola de planificación. Este tiempo virtual se incrementa mientras el proceso no está en ejecución y se reduce mientras se ejecuta, lo que garantiza una justa distribución de recursos de CPU.

* **Estructura de datos eficiente**: El CFS utiliza una estructura de datos basada en un árbol rojo-negro para mantener la lista de procesos en ejecución. Esta estructura permite una búsqueda eficiente del próximo proceso a ejecutar, lo que mejora el rendimiento del planificador.

* **Gestión eficiente de recursos compartidos**: El CFS es capaz de manejar eficientemente situaciones donde múltiples procesos comparten recursos de CPU, como sistemas multiprocesador o con múltiples núcleos. También puede manejar afinidades de CPU, permitiendo que los procesos se ejecuten en núcleos específicos según sea necesario.

* **Transparencia y previsibilidad**: El CFS está diseñado para ofrecer una experiencia de usuario transparente y predecible al asignar tiempo de CPU a los procesos. Los usuarios pueden confiar en que el sistema asignará recursos de CPU de manera justa y equitativa, lo que ayuda a garantizar un rendimiento uniforme del sistema.
