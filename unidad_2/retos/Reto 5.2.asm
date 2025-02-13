/*
                                         __              __ 
                                         )_) _  _)_ _    )_ 
                                        / \ )_) (_ (_)    _)
                                           (_                                                       
*/

/*
Traduce este programa a lenguaje ensamblador:

int a = 10;
int *p;
p = &a;
*p = 20;
*/

@10
D=A 
@a 
M=D
D=A
@p
M=D
@20
D=A 
@p
A=M
M=D

// Para esta traducción se busca declarar la variable p como puntero de a, para luego de 
// desreferenciar a p, asignarle el valor de 20 a la dirección de memoria de a.