# Actividad 4

### **1. ¿Qué hace el código del ejemplo?**

El programa crea un efecto interactivo donde, un plano (representado como una malla de líneas), se dibuja en el centro de la pantalla. Cuando el mouse se acerca a los vértices del plano, estos son repelidos (se desplazan en dirección opuesta al mouse). El color del plano cambia de magenta a azul según la posición horizontal del mouse. 

Esto genera un wireframe que reacciona al movimiento del mouse, combinado con un gradiente de color dinámico.

### **2. Comunicación entre la aplicación y los shaders**

**Aplicación (CPU):**

Calcula la posición del mouse (mouseX, mouseY) y la normaliza respecto al centro.

Pasa datos al shader mediante uniforms:

```cpp
shader.setUniform1f("mouseRange", 150);  // Rango de afectación del mouse.
shader.setUniform2f("mousePos", mx, my); // Posición del mouse (vec2).
shader.setUniform4fv("mouseColor", &mouseColor[0]); // Color (vec4).
```

Dibuja el plano con plane.drawWireframe().

**Vertex Shader (GPU):**

Recibe los uniforms (mouseRange, mousePos, mouseColor).

Repulsión de vértices:

- Calcula la distancia entre el mouse y cada vértice (distance).

- Si el vértice está dentro del rango (mouseRange), lo desplaza en dirección opuesta al mouse (dir *= distNorm).

Transforma la posición final con modelViewProjectionMatrix.

**Fragment Shader (GPU):**

Asigna el color pasado desde la aplicación (mouseColor) a todos los fragmentos.

### **3. Modificaciones sencillas**

**A. Cambios en ofApp.cpp y Vertex Shader**

Objetivo: Hacer que los vértices sean atraídos (no repelidos) por el mouse.

Modificación en el Vertex Shader:
Cambia la dirección del desplazamiento:

```cpp
// Antes (repulsión):
pos.x += dir.x;
pos.y += dir.y;
// Después (atracción):
pos.x -= dir.x;
pos.y -= dir.y;
```

**B. Cambios en el Fragment Shader**

Objetivo: Mostrar un gradiente radial basado en la distancia al mouse.

Nuevo Fragment Shader:

```cpp
#version 150
out vec4 outputColor;
uniform vec2 mousePos;
uniform float mouseRange;

void main() {
    float dist = distance(gl_FragCoord.xy, mousePos);
    float intensity = 1.0 - smoothstep(0.0, mouseRange, dist);
    outputColor = vec4(intensity, 0.5, 1.0 - intensity, 1.0);
}
```

Efecto: Un gradiente que va de magenta (cerca del mouse) a azul claro (lejos del mouse).