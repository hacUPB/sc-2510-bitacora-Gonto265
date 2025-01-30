/* 

ACTIVIDADES: investigación

Actividad 1

### ¿Que es una computadora digital moderna?

- Es un dispositiva electrónico que procesa información, utiliza códigos binarios, 
almacena bastante información, puede realizar cálculos aritméticos, permite escribir textos, 
navegación por el internet, etc.

### ¿Cúales son sus partes?

- Está compuesta por una fuente de alimentación, La placa madre, Memoria RAM, Unidad de disco duro, 
microprocesador, gabinete y sus respectivos conectores, cables y puertos.

Actividad 2

### ¿Que es entonces un programa?

- El sistema operativo carga el programa en la memoria y sigue sus instrucciones, 
las cuales son codigo escrito que conlleva a la relización de tareas especificas.

### ¿Que es el lenguaje ensamblador?

- El lenguaje ensamblador, compuesto por instrucciónes de basico entendimiento humano, 
está referido a un lenguaje de codigo el cual puede entender la CPU de forma directa.

### ¿Que es el lenguaje de máquina?

- Se refiere al lenguaje de programación más básico, se compone de instrucciones muy específicas, 
codificadas en formato binario, el cual puede leer y ejecutar inmediatamente la CPU.
*/

// RETOS

// 1.

@1978
D=A

// 2.

@69
D=A
@100
M=D

// 3.

@24
D=M
@200
M=D

// 4.

@100
D=M 
@15
D=D-A
@100
M=D 

// 5.

@0
D=M 
@1
D=D+M
@69
D=D+A
@2
M=D

// 6.

@100
D;JEQ

// 7.

@100
D=M
D=D-A
@20
D;JLT

// 8.

// * Este programa suma y guarda la información almacenada en las variables var1 y var2 en la variable var3.

// * var1, var2 y var3 están posicionados en las direcciones de memoria 16, 17 y 18 respectivamente.Porque las posiciones de memoria RAM de 0 a 15 tienen los nombres simbólicos R0 a R15, por lo que las variables nombradas se almacenan a partir de la posición 16.

// 9.

// * Este progama asigna el valor 1 y 0 a las variables i y sum respectivamente, para luego adicionar el valor de i al de sum y después sumar 1 al valor de i.

// * i y sum están posicionados en las direcciones de memoria 16 y 17 respectivamente. Porque las posiciones de memoria RAM de 0 a 15 tienen los nombres simbólicos R0 a R15, por lo que las variables nombradas se almacenan a partir de la posición 16.

// *

@i
M=M+1

// 10.

@0
D=M
M=D+M
D=M
@1
M=D

// 11.

