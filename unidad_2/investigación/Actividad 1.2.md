# Actividad 1

### ¿Qué es la entrada-salida mapeada a memoria?

- Se refiere a la técnica de mapear los registros de entrada/salida de un dispositivo a direcciones
de memoria, de tal forma que se puedan acceder a ellos como si fueran celdas de memoria.

### ¿Cómo se implementa en la plataforma Hack?

- Se usa la instrucción @ para acceder a la dirección de memoria de un registro de entrada/salida.

### Inventa un programa que haga uso de la entrada-salida mapeada a memoria.
```

@100
D=A
@arr
M=D
@10
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
D;JGE
@arr 
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

```
### Investiga el funcionamiento del programa con el simulador.

- El programa guarda exitosamente el valor de -1 en las 10 consiguientes al 
espacio de memoria 100.