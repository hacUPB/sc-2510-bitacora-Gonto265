// Actividad 3.2

(LOOP)
@24576
D=M
@100
D=D-A
@draw
D;JEQ
@undraw
0;JMP
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
	(undraw)
	@SCREEN
	D=A
	@R12
	AD=D+M
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	D=A 
	@30
	AD=D+A
	M=0
	AD=A+1 
	M=0
	AD=A+1 
	M=0
	@R13
	A=M
	D;JMP