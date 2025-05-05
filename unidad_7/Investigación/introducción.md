1. **¿Qué son los vértices?**

Los vértices son puntos en el espacio 3D (o 2D) que definen la estructura de una forma geométrica. En una malla (mesh), los vértices almacenan información como posición, color, coordenadas de textura y normales.

2. **¿Con qué figura geométrica se dibuja en 3D?**

En gráficos 3D, la figura básica es el triángulo, ya que cualquier superficie compleja puede descomponerse en triángulos (triangulación). OpenFrameworks usa ofMesh para almacenar vértices organizados en triángulos.

3. **¿Qué es un shader?**

Un shader es un programa pequeño que se ejecuta en la GPU para manipular vértices (vertex shader) o píxeles (fragment shader). Permiten efectos avanzados como iluminación, sombras o post-procesado.

4. **¿Cómo se le llaman a los grupos de píxeles de un mismo triángulo?**

Se llaman fragmentos. Durante el rasterizado, los triángulos se dividen en fragmentos (uno por cada píxel cubierto).

5. **¿Qué es un fragment shader?**

El fragment shader (o pixel shader) determina el color final de cada fragmento/píxel. Puede aplicar texturas, iluminación o efectos como transparencia.

6. **¿Qué es un vertex shader?**

El vertex shader transforma las posiciones de los vértices (ej: proyección 3D a 2D). También puede deformar la geometría o pasar datos a los fragment shaders.

7. **¿Al proceso de determinar qué píxeles del display va a cubrir cada triángulo de una mesh se le llama?**

Se llama rasterización (rasterization). Convierte los triángulos en fragmentos/píxeles.

8. **¿Qué es el render pipeline?**

Es el proceso secuencial que sigue la GPU para renderizar una escena:

Vértices → Vertex Shader → Rasterización → Fragment Shader → Framebuffer  
Incluye etapas como transformaciones, iluminación y pruebas de profundidad (Z-buffer).

9. **¿Hay alguna diferencia entre aplicar un color a una superficie de una mesh o aplicar una textura?**

Color: Uniforme para toda la superficie (ej: ofSetColor() en OpenFrameworks).

Textura: Imagen mapeada sobre la mesh (ej: ofImage o ofTexture). Los shaders pueden mezclar ambos.

10. **¿Cuál es la diferencia entre una textura y un material?**

Textura: Imagen 2D aplicada a la superficie (solo color/albedo).

Material: Define propiedades visuales completas (color, reflectividad, rugosidad) usando texturas + parámetros (ej: PBR Physically Based Rendering).

11. **¿Qué transformaciones se requieren para mover un vértice del 3D world al View Screen?**

Model Matrix: Posición/orientación del objeto en el mundo.

View Matrix: Transformación a coordenadas de cámara.

Projection Matrix: Proyección 3D → 2D (ej: perspectiva u ortográfica).
(En OpenFrameworks, esto se maneja con ofTranslate(), ofRotate(), y ofPerspective()).

12. **¿Al proceso de convertir los triángulos en fragmentos se le llama?**

Rasterización (o scan conversion).

13. **¿Qué es el framebuffer?**

Es el buffer de memoria donde la GPU escribe los píxeles finales de la imagen renderizada (incluye color, profundidad, etc.). En OpenFrameworks, se usan ofFbo (Frame Buffer Objects) para renderizado off-screen.

14. **¿Para qué se usa el Z-buffer o depth buffer en el render pipeline?**

Para resolver la visibilidad de los objetos: almacena la profundidad (Z) de cada píxel y descarta los fragmentos ocultos por otros más cercanos.

15. **¿Por qué la GPU tiene que funcionar tan rápido y de manera paralela?**

Porque debe procesar millones de vértices/fragmentos por frame (ej: 60 FPS). Su arquitectura paralela (cientos de núcleos) permite ejecutar shaders simultáneamente en grandes cantidades de datos.