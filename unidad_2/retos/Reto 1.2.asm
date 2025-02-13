/*
                                         __                  
                                         )_) _  _)_ _    /(  
                                        / \ )_) (_ (_)    _)_
                                           (_                
*/

/*
* Escribe un programa en lenguaje ensamblador que sume los primeros 100 números naturales.}

      int i = 1;
      int sum = 0;
      While (i <= 100){
         sum += i;
         i++;
      }
*/

@i 
M=0
@sum
M=0
(LOOP)
@i 
D=M
@100
D=D-A
@END
D;JEQ
@i 
D=M
@sum 
M=M+D
@i 
M=M+1
@LOOP
0;JMP
(END)
@END
0;JMP

/*

Realizé este programa: declarando e inicializando las variable de i y sum, estableciendo
un condicional según el valor de i, sumando acumulativamente el valor de i a sum, incrementando
el valor de i en 1 y repitiendo el proceso hasta que i sea igual a 100.

* ¿Cómo están implementadas las variables i y sum?

- La variable i está implementada como variable de memoria que almacena un valor que aumenta su 
valor en 1 por iteración, sum está implementada de la misma manera, pero almacena la suma 
acumulativa de i.

* ¿En qué direcciones de memoria están estas variables?

- i está en la dirección de memoria 16 y sum en la dirección de memoria 17.

* ¿Cómo está implementado el ciclo while?

- El ciclo while está implementado con un salto condicional, que usa el label LOOP, que se realiza
si i es igual a 100, en caso de que no se cumpla la condición, se realiza un salto 
incondicional al inicio del ciclo.

* ¿Cómo se implementa la variable i?

- Guardando su valor en el registro D, para usarlo en la condición para examinar la iteración, paraq sumar periodicamente su valor y al final sumandole 1 hasta llegar a 100.

* ¿En qué parte de la memoria se almacena la variable i?

- Esta variable está almacenada en la memoria RAM en la dirección 16.

* Después de todo lo que has hecho, ¿Qué es entonces una variable?

- Es un nombre simbólico que se le asigna a una dirección de memoria, para almacenar un valor modificable.

* ¿Qué es la dirección de una variable?

- Es la ubicación en la memoria RAM donde se almacena el valor de una variable.

* ¿Qué es el contenido de una variable?

- Se refiere a los datos que se almacenan en una dirección de memoria asignada a una variable.

*/