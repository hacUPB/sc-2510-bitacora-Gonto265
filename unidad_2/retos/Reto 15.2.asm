/*
                                         __                  __ 
                                         )_) _  _)_ _    /(  )_ 
                                        / \ )_) (_ (_)    _)_ _)
                                           (_                   
*/

@333
D=A
@R0
M=D
@5
D=A
@R1
M=D
@i
M=0
(LOOP)
@i
D=M
@R1
D=D-M
@END
D;JEQ
@R0
D=M
@i
A=D+M
M=-1
@i
M=M+1
@LOOP
0;JMP
(END)
@END
0;JMP