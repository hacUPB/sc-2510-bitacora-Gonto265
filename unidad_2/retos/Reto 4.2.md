# Reto 4.2

Ahora vamos a acercarnos al concepto de puntero. Un puntero es una variable que almacena la 
dirección de memoria de otra variable. Observa el siguiente programa escrito en C++:
    
    int a = 10;
    int *p;
    p = &a;
    *p = 20;
    
    El programa anterior modifica el contenido de la variable `a` por medio de la variable `p`. 
    `p` es un puntero porque almacena la dirección de memoria de la variable `a`. En este caso el 
    valor de la variable `a` será 20 luego de ejecutar `*p = 20;`. Ahora analiza:

El programa anterior modifica el contenido de la variable `a` por medio de la variable `p`. `p` es un puntero porque almacena la dirección de memoria de la variable `a`. En este caso el valor de la variable `a` será 20 luego de ejecutar `*p = 20;`. Ahora analiza:

- ¿Cómo se declara un puntero en C++? `int *p;`. `p` es una variable que almacenará la dirección de un variable que almacena enteros.
- ¿Cómo se define un puntero en C++? `p = &a;`. Definir el puntero es inicializar el valor del puntero, es decir, guardar la dirección de una variable. En este caso `p` contendrá la dirección de `a`.
- ¿Cómo se almacena en C++ la dirección de memoria de una variable? Con el operador `&`. `p = &a;`
- ¿Cómo se escribe el contenido de la variable a la que apunta un puntero? Con el operador ``. `p = 20;`. En este caso como `p` contiene la dirección de `a` entonces `p` a la izquierda del igual indica que quieres actualizar el valor de la variable `a`.
