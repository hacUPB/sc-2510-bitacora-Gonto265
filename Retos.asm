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

// * Con este programa se está creando un ciclo de sustracción de una unidad al valor almacenado en i gracias alos saltos de operación y el label LOOP, esto sucederá hata que i tome el valor de 0, pues el label CONT redirigirá el orden de operaciones.

// * La variable i está ubicada en la memoria RAM en la dirección 16.

// * Este comentario no se encuentra almacenado en ninguna memoria de la CPU gracias al software compilador.

// * La primera instrucción se refiere a @1000,  el cual está almacenada en la memoria ROM en la posición 0.

// * CONT y LOOP son labels que permiten redirigir el flujo de operaciones.

// * La diferéncia entre los símbolos i y CONT es que i es una variable y CONT es un label.

// 12.

@R1
D=M
@R2
D=D+M
@69
D=D+A 
@R4
M=D

// 13.

(LOOP)
@R0
D=M
@R8
D;JGE
@R1
M=-1
@LOOP
0;JMP
@R1
M=1
@LOOP
0;JMP

// 14.

@R1
D=A 
@R4
M=D

// 15.

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

// 16.

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

// 17.

@R0
D=A
@7
D=D-A
@69
D;JEQ

// 18.

// * (Y)

// 19.

// * Este programa está adecuado para que al numero guardado en la posicion 16 (16384) se le sume 1 por iteración mientras que alguna tecla esté oprimida, si la tecla es soltada, la maquina empezará a restar 1 por iteración al numero acumulado, este proceso pudiendo ser interrumpido por presionar una tecla para seguir sumando.

// 20.

(LOOP)
@24576
D=M
@100
D=D-A
@LOOP 
D;JNE
(draw)
	// put bitmap location value in R12
	// put code return address in R13
	@SCREEN
	D=A
	@R12
	AD=D+M
	// row 2
	@112 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@124 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@31774 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@505 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@25 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 6
	D=A // D holds previous addr
	@31
	AD=D+A
	@253 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@57 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@31
	AD=D+A
	@32131 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@51 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 8
	D=A // D holds previous addr
	@31
	AD=D+A
	@14791 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@51 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@31
	AD=D+A
	@18 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@51 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 10
	D=A // D holds previous addr
	@31
	AD=D+A
	@2 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@49 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 11
	D=A // D holds previous addr
	@31
	AD=D+A
	@4 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@56 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 12
	D=A // D holds previous addr
	@31
	AD=D+A
	@32764 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@28 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 13
	D=A // D holds previous addr
	@31
	AD=D+A
	@4 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@15 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 14
	D=A // D holds previous addr
	@31
	AD=D+A
	@4 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@7 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 15
	D=A // D holds previous addr
	@31
	AD=D+A
	@2 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	M=1
	// row 16
	D=A // D holds previous addr
	@31
	AD=D+A
	@32766 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 17
	D=A // D holds previous addr
	@32
	AD=D+A
	@16382 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 18
	D=A // D holds previous addr
	@32
	AD=D+A
	@15423 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 19
	D=A // D holds previous addr
	@32
	AD=D+A
	@15375 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 20
	D=A // D holds previous addr
	@32
	AD=D+A
	@15367 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 21
	D=A // D holds previous addr
	@32
	AD=D+A
	@14343 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 22
	D=A // D holds previous addr
	@32
	AD=D+A
	@30727 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 23
	D=A // D holds previous addr
	@32
	AD=D+A
	@30727 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 24
	D=A // D holds previous addr
	@32
	AD=D+A
	@28675 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 25
	D=A // D holds previous addr
	@32
	AD=D+A
	@28675 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 26
	D=A // D holds previous addr
	@32
	AD=D+A
	@24579 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 27
	D=A // D holds previous addr
	@32
	AD=D+A
	@8185 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	M=1
	// row 28
	D=A // D holds previous addr
	@31
	AD=D+A
	@16378 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	M=1
	// return
	@R13
	A=M
	D;JMP