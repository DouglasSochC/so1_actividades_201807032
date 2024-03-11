**Nombre:** Douglas Alexander Soch Catalán
**Carnet:** 201807032

## Completando el programa

```C
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

void thread_create(void *(*start_routine)(void *), void *arg) {
    pthread_t tid;
    pthread_create(&tid, NULL, start_routine, arg);
}

int main() {
    pid_t pid;
    
    pid = fork();
    
    if (pid == 0) { /* child process */
        fork();
        thread_create(&some_function, NULL);
    }
    
    fork();

    return 0;
}

void *some_function(void *arg) {
    // Do something in the thread
    printf("Thread is running...\n");
    return NULL;
}
```

## Preguntas

### ¿Cuántos procesos únicos son creados?

Según el codigo compeltado, se crean procesos en cada llamada al metodo fork(). Por lo tanto, el número de procesos únicos creados es 2^3 = 8.

### ¿Cuántos hilos únicos son creados?

Se crea un hilo en la línea thread_create(&some_function, NULL);. Dado que esta línea se ejecuta en cada uno de los 8 procesos creados, el número total de hilos únicos creados es 8.