/*
                                         __                  
                                         )_) _  _)_ _    /(  
                                        / \ )_) (_ (_)    _)_
                                           (_                
*/

@i 
M=1
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

- La variable i está implementada como variable de memoria que almacena valores ascendentes que con el fin de 

