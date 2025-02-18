/*
                                         __               _  
                                         )_) _  _)_ _    (_\ 
                                        / \ )_) (_ (_)     _)
                                           (_                                                       
*/

/*
Considera que el punto de entrada del siguiente programa es la función main, es decir, el programa
inicia llamando la función main. Vas a proponer una posible traducción a lenguaje ensamblador de 
la función suma, cómo llamar a suma y cómo regresar a 
std::cout << "El valor de c es: " << c << std::endl; una vez suma termine.

#include <iostream>

   int suma(int a, int b) {
      int var = a + b;
      return var;
   }

   int main() {
      int c = suma(6, 9);
      std::cout << "El valor de c es: " << c << std::endl;
      return 0;
   }
*/

/*
Función suma:
(suma)
@a
D=M
@b
D=D+M
@var
M=D
D=M
@suma
M=D
*/

/*
Para llamar a suma:
(main)
@sum
0;JMP
*/

/*
Para regresar a std::cout << "El valor de c es: " << c << std::endl;

(main)

@6
D=A
@a 
M=D
@9
D=A
@b
M=D
*/

// código completo:

@main
0;JMP
(suma)
@a
D=M
@b
D=M+M
@var
M=D
D=M
@suma
M=D
@end
0;JMP
(main)
@6
D=A
@a 
M=D
@9
D=A
@b
M=D
@STR
D=A
@R0
M=D 
@R0
    A=M
    D=M
    @SCREEN
    M=D
    @R0
    M=M+1
    @END_PRINT_LOOP
    D;JEQ
    @PRINT_LOOP
(END_PRINT_LOOP)
   (STR)
    @E
    M=69
    @l
    M=108
    @_
    M=32
    @v
    M=118
    @a
    M=97
    @l
    M=108
    @o
    M=111
    @r
    M=114
    @_
    M=32
    @d
    M=100
    @e
    M=101
    @_
    M=32
    @c
    M=99
    @_
    M=32
    @e
    M=101
    @s
    M=115
    @:
    M=58
    @_
    M=32
    @0
    M=0
@c
D=M
@SCREEN
M=D
@suma
0;JMP
(end)
@end
0;JMP