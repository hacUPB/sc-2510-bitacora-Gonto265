# Actividad 2

Comienza realizando la lectura de la introducción del tutorial [Introducing Shaders](https://openframeworks.cc/ofBook/chapters/shaders.html). Realiza la sección Your First Shader, pero antes de ejecutar el código, realiza un pequeño experimento. Modifica ligeramente el método draw:

```cpp
void ofApp::draw(){
    ofSetColor(255);

    //shader.begin();

    ofDrawRectangle(0, 0, ofGetWidth(), ofGetHeight());

    //shader.end();
}
```

Observa la salida.

Ahora ejecuta el código original. ¿Qué resultados obtuviste?

#### ¿Cómo funciona?

El VertexShader transforma las coordenadas 3D de los vértices (en este caso, los 4 vértices del rectángulo) a coordenadas 2D de pantalla.

El FragmentShader calcula el color de cada píxel (fragmento) del rectángulo.

gl_FragCoord: Coordenada del píxel en la pantalla.

Normaliza X e Y para que estén en el rango [0, 1].

Esto crea un gradiente donde:

Rojo aumenta de izquierda (X=0) a derecha (X=1).

Verde aumenta de abajo (Y=0) a arriba (Y=1).

Azul es constante (1.0), lo que mezclado con rojo y verde da amarillo en la esquina superior derecha.

Se aprecia un color azul puro desde la parte inferior izquierda, violeta en la derecha, verde aguamarina arriba y blanco en la parte superior derecha, donde se juntan todos los colores en el máximo esplendor.

#### ¿Qué resultados obtuviste?

Sin shaders: Color plano (blanco).

Con shaders: Gradiente generado por el fragment shader.

#### ¿Estás usando un vertex shader?

Sí, pero solo para la transformación estándar (no modifica la posición de los vértices).

#### ¿Estás usando un fragment shader?

Sí, es el responsable del gradiente de colores.

#### Analiza el código de los shaders. ¿Qué hace cada uno?

Vertex Shader: Proyecta vértices en 2D.

Fragment Shader: Asigna colores dinámicos basados en la posición del píxel.