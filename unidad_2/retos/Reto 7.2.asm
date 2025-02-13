/*
                                         __              __ 
                                         )_) _  _)_ _      )
                                        / \ )_) (_ (_)    ( 
                                           (_               
*/

/*
   Traduce este programa a lenguaje ensamblador:
      int a = 10;
      int b = 5;
      int *p;
      p = &a;
      b = *p;
*/

@10
D=A 
@a 
M=D
D=A
@p 
M=D
@5
D=A
@b
M=D
@p 
A=M
D=M
@b
M=D

// Para esta traducción se busca declarar la variable p como puntero de a, para luego de 
// desreferenciar a p, asignarle su dirección a la memoria de b.