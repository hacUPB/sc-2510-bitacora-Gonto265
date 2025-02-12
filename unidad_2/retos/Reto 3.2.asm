/*
                                         __              _ 
                                         )_) _  _)_ _    _)
                                        / \ )_) (_ (_)   _)
                                           (_              
*/

// Escribe un programa en lenguaje ensamblador que implemente el programa anterior.

@222
D=A
@adr
M=D 
@i
M=0
(LOOP1)
@i 
D=M
@10
D=D-A
@END1
D;JEQ
@adr 
D=M
@i
A=D+M
M=1
@i
M=M+1
@LOOP1
0;JMP
(END1)
@i
M=0
@sum
M=0
(LOOP2)
@i 
D=M
@100
D=D-A
@END2
D;JEQ
@adr 
D=M
@i
A=D+M
D=M
@sum 
M=D+M
@i 
M=M+1
@LOOP2
0;JMP
(END2)
@END2
0;JMP

// Este programa implementa el anterior pues es usado para sumar los valores que contiene un array.