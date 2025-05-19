# Actividad 3

Ahora vas a pasar información personalizada de tu programa a los shaders. Vas a leer con detenimiento el tutorial Adding Uniforms.

### ¿Qué es un uniform?

Un uniform es una variable global que permite comunicar datos desde tu aplicación (CPU) hacia los shaders (GPU).

### ¿Cómo funciona el código de aplicación, los shaders y cómo se comunican estos?

#### Aplicación (CPU):

Carga los shaders (shader.load("ruta")).

Prepara datos (vértices, uniforms, texturas).

En draw(), llama shader.begin() y shader.end() para activar el shader.

#### Shaders (GPU):

Vertex Shader: Transforma vértices (ej: posición, normales).

Fragment Shader: Calcula el color de cada píxel.

### Comunicación:

Atributos (in en GLSL): Datos por vértice (ej: posición, color, coordenadas UV).

```cpp
ofMesh mesh;
mesh.addVertex(ofVec3f(x, y, z));  // Pasa atributos a los vértices.
```

Uniforms: Datos constantes para todos los vértices/fragmentos en un draw().

Texturas: Se pasan como uniform sampler2D y se asignan con setUniformTexture.

### Modifica el código de la actividad para cambiar el color de cada uno de los píxeles de la pantalla personalizando el fragment shader.

Cambio los componentes de tal forma que sus colores sean semejantes a los de la de una aurora boreal, además de invertir la dirección del gradiente.

```cpp
    float r = 0.5-(gl_FragCoord.x / windowWidth);
	float g = 0.5-(gl_FragCoord.y / windowHeight);
	float b = 0.3;
	float a = 0.7;
	outputColor = vec4(r, g, b, a);
```