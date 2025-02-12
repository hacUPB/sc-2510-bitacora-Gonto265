/*
                                         __                  
                                         )_) _  _)_ _    /_(_
                                        / \ )_) (_ (_)      )
                                           (_                                                       
*/

/*
4. Ahora vamos a acercarnos al concepto de puntero. Un puntero es una variable que almacena la 
dirección de memoria de otra variable. Observa el siguiente programa escrito en C++:
    
    ```cpp
    int a = 10;
    int *p;
    p = &a;
    *p = 20;
    ```
    
    El programa anterior modifica el contenido de la variable `a` por medio de la variable `p`. 
    `p` es un puntero porque almacena la dirección de memoria de la variable `a`. En este caso el 
    valor de la variable `a` será 20 luego de ejecutar `*p = 20;`. Ahora analiza:
*/

@100
D=M 
@15
D=D-A
@100
M=D 