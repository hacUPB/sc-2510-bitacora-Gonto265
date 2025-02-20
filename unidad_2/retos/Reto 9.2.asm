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

   (main)
   @6
   D=A
   @a
   M=D
   @9
   D=A
   @b
   M=D
// llamado de la función suma
   @suma
   0;JMP
// std::cout << "El valor de c es: " << c << std::endl;
   @end
   0;JMP
// función suma:
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
   @main
   D=A
   @mainadr
   M=D 
   @10
   D=A 
   @mainadr
   A=D+M
   0;JMP
   (end)
   @end
   0;JMP
