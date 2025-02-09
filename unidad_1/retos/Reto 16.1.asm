/*
                                         __                   _  
                                         )_) _  _)_ _    /(  (__ 
                                        / \ )_) (_ (_)    _)_ \_)
                                           (_                    
*/

@100
D=A
@arr
M=D 
@10
D=A
@R1
M=D
@sum
M=0 
@j 
M=0 
(LOOP)
@j 
D=M
@R1
D=D-M
@END
D;JEQ
@arr
D=M
@j
A=D+M
D=M 
@sum 
M=D+M
@j
M=M+1
@LOOP
0;JMP
(END)
@END
0;JMP

// * Este programa suma un total, recorriendo valor por valor en un array de 10 espacios.

// * La dirección base de arr está ubicado en la memoria RAM en la direccion 16.

// * La dirección base de j está ubicado en la memoria RAM en la direccion 17. Ya que ésta variable fue expresada después de la variable arr.

// * El array está ubicado en la memoria RAM en la direccion 18. Ya que ésta variable fue expresada después de la variable j.
