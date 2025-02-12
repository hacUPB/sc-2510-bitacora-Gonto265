/*
                                         __              _ 
                                         )_) _  _)_ _     )
                                        / \ )_) (_ (_)   /_
                                           (_                        
*/

// Transforma el programa en alto nivel anterior para que utilice un ciclo for en vez de un ciclo while.

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

// Honestamente no se la diferencia.