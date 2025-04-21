# Reto

Vas a desarrollar una aplicación que genere una cuadrícula de esferas en un espacio tridimensional y que permita interactuar con ellas a través de la cámara y el ratón. Deberás implementar la lógica para seleccionar una esfera con el ratón y mostrar la información de la esfera seleccionada en la pantalla.

Para calcular el valor en `z` de cada esfera usa esta función:

```cpp
float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud;
```

Donde `distDiv` y `amplitud` son variables que puedes modificar con el teclado.

Al generar la cuadrícula de esferas puedes usar bucles anidados para recorrer las posiciones:

```cpp
for (int x = -ofGetWidth() / 2; x < ofGetWidth() / 2; x += xStep) {
    for (int y = -ofGetHeight() / 2; y < ofGetHeight() / 2; y += yStep) {
```

Nota que `xStep` y `yStep` son variables que puedes modificar con el teclado. En la imagen que te mostré e3w22anteriormente `xStep` y `yStep` tienen el mismo valor.

Para seleccionar una esfera con el mouse:

Puedes usar los siguientes métodos:

```cpp
void ofApp::mousePressed(int x, int y, int button) {
    // Convertir las coordenadas del mouse en un rayo 3D
    glm::vec3 rayStart, rayEnd;
    convertMouseToRay(x, y, rayStart, rayEnd);

    // Comprobar si el rayo intersecta alguna esfera
    sphereSelected = false;
    for (auto& pos : spherePositions) {
        glm::vec3 intersectionPoint;
        if (rayIntersectsSphere(rayStart, rayEnd - rayStart, pos, 5.0, intersectionPoint)) {
            // EN ESTA PARTE Debes adicionar la lógica para indicarle
            // a la aplicación la esfera seleccionada.
        }
    }
}
```
```cpp
void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd) {
    // Obtener matrices de proyección y modelo/vista de la cámara
    glm::mat4 modelview = cam.getModelViewMatrix();
    glm::mat4 projection = cam.getProjectionMatrix();
    ofRectangle viewport = ofGetCurrentViewport();

    // Convertir coordenadas del mouse a Normalized Device Coordinates (NDC)
    float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
    float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;

    // Crear el rayo en NDC
    glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f); // Near plane
    glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f);   // Far plane

    // Convertir a coordenadas mundiales
    glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
    glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;

    rayStartWorld /= rayStartWorld.w;
    rayEndWorld /= rayEndWorld.w;

    rayStart = glm::vec3(rayStartWorld);
    rayEnd = glm::vec3(rayEndWorld);
}

// Detectar si el rayo intersecta una esfera
bool ofApp::rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint) {
    glm::vec3 oc = rayStart - sphereCenter;

    float a = glm::dot(rayDir, rayDir);
    float b = 2.0f * glm::dot(oc, rayDir);
    float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;

    float discriminant = b * b - 4 * a * c;

    if (discriminant < 0) {
        return false;
    }
    else {
        float t = (-b - sqrt(discriminant)) / (2.0f * a);
        intersectionPoint = rayStart + t * rayDir;
        return true;
    }
}
```
​
### **Requisitos de la aplicación**

1. **Generación de esferas:** utiliza bucles anidados para generar posiciones de esferas en una cuadrícula tridimensional. Las posiciones deben almacenarse en un vector de `ofVec3f`.
2. **Interacción con el ratón:** implementa la funcionalidad para seleccionar una esfera con el ratón. Al seleccionar una esfera, debes mostrar sus coordenadas en pantalla.
3. **Interacción con el teclado:** implementa controles básicos para modificar la separación entre esferas, la amplitud de sus posiciones en el eje Z, y otros parámetros visuales.
4. **Visualización:** utiliza una cámara 3D (`ofEasyCam`) para permitir la exploración de la escena desde diferentes ángulos.

1. **Generación de esferas:** utiliza bucles anidados para generar posiciones de esferas en una cuadrícula tridimensional. Las posiciones deben almacenarse en un vector de `ofVec3f`.
2. **Interacción con el ratón:** implementa la funcionalidad para seleccionar una esfera con el ratón. Al seleccionar una esfera, debes mostrar sus coordenadas en pantalla.
3. **Interacción con el teclado:** implementa controles básicos para modificar la separación entre esferas, la amplitud de sus posiciones en el eje Z, y otros parámetros visuales.
4. **Visualización:** utiliza una cámara 3D (`ofEasyCam`) para permitir la exploración de la escena desde diferentes ángulos.

### Análisis de Memoria

Además de implementar la aplicación, debes analizar cómo y dónde se almacenan los datos en la memoria. Para ello:

1. **Investiga:** investiga cómo se gestionan los vectores de `ofVec3f` en C++. ¿Dónde se almacenan? ¿En qué parte de la memoria se guardan los objetos y cómo se gestionan?
2. **Experimenta:** utiliza el depurador de Visual Studio para examinar la memoria de la aplicación en tiempo de ejecución. Observa en qué parte de la memoria se encuentran los objetos (`stack`, `heap`, memoria global).
3. **Documenta:** documenta tus hallazgos en un informe breve, explicando qué descubriste sobre la gestión de la memoria en tu aplicación.

## Respuesta

en ofApp.h

```cpp
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp {
public:
    void setup();
    void update();
    void draw();

    void keyPressed(int key);
    void mousePressed(int x, int y, int button);

    // Funciones adicionales
    void generateSpheresGrid();
    void convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd);
    bool rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint);

    // Variables de la aplicación
    struct Sphere {
    glm::vec3 position;
    ofColor color;
    };

    std::vector<Sphere> spheres;
    glm::vec3 selectedSpherePosition;
    bool sphereSelected = false;

    int xStep = 50;  // Espaciado en el eje X (modificable con el teclado)
    int yStep = 50;  // Espaciado en el eje Y (modificable con el teclado)
    float distDiv = 100.0f; // Modificable con el teclado
    float amplitud = 100.0f; // Modificable con el teclado
    float sphereRadius = 5.0f;

    int numSpheresX = 10;  // Número inicial de esferas en el eje X
    int numSpheresY = 10;  // Número inicial de esferas en el eje Y
  

    float spacing = 50.0f;  // Espaciado constante entre las esferas


    // Cámara 3D
    ofEasyCam cam;
};
```

em ofApp.cpp

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
    cam.setupPerspective();
    generateSpheresGrid();
}

//--------------------------------------------------------------
void ofApp::update() {
    // No hay actualizaciones necesarias por ahora
}

//--------------------------------------------------------------
void ofApp::draw() {
    cam.begin();
    
    for (auto& sphere : spheres) {
        ofSetColor(sphere.color);  // Usar el color individual
        ofDrawSphere(sphere.position, sphereRadius);
    }
    
    cam.end();

    // [El resto del código de dibujado permanece igual]
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
    // Modificar parámetros con las teclas
    if (key == OF_KEY_UP) {
        amplitud += 10;
    }
    else if (key == OF_KEY_DOWN) {
        amplitud -= 10;
    }

    // Cambiar la cantidad de esferas con 'a' y 's'
    if (key == 'a') {
        numSpheresX += 1;  // Aumentar cantidad de esferas en X
        numSpheresY += 1;  // Aumentar cantidad de esferas en Y
    }
    else if (key == 's') {
        numSpheresX = std::max(1, numSpheresX - 1);  // Reducir cantidad de esferas en X
        numSpheresY = std::max(1, numSpheresY - 1);  // Reducir cantidad de esferas en Y
    }

    generateSpheresGrid();  // Volver a generar la cuadrícula con los nuevos valores
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
    glm::vec3 rayStart, rayEnd;
    convertMouseToRay(x, y, rayStart, rayEnd);

    sphereSelected = false;
    for (auto& sphere : spheres) {
        glm::vec3 intersectionPoint;
        if (rayIntersectsSphere(rayStart, rayEnd - rayStart, 
                              sphere.position, sphereRadius, intersectionPoint)) {
            sphereSelected = true;
            selectedSpherePosition = sphere.position;
            break;
        }
    }
}

//--------------------------------------------------------------
void ofApp::generateSpheresGrid() {
    spheres.clear();  // Limpiar las esferas anteriores
    ofRandomize();

    float gridWidth = spacing * (numSpheresX - 1);
    float gridHeight = spacing * (numSpheresY - 1);

    for (int i = 0; i < numSpheresX; i++) {
        for (int j = 0; j < numSpheresY; j++) {
            float x = i * spacing - gridWidth / 2;
            float y = j * spacing - gridHeight / 2;
            float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud;
            
            Sphere sphere;
            sphere.position = glm::vec3(x, y, z);
            
            // Asignar color aleatorio (HSV para mejores variaciones)
            sphere.color.setHsb(ofRandom(160, 200), ofRandom(180, 255), ofRandom(200, 255));
            
            spheres.push_back(sphere);
        }
    }
}

//--------------------------------------------------------------
void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd) {
    glm::mat4 modelview = cam.getModelViewMatrix();
    glm::mat4 projection = cam.getProjectionMatrix();
    ofRectangle viewport = ofGetCurrentViewport();

    float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
    float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;

    glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f);
    glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f);

    glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
    glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;

    rayStartWorld /= rayStartWorld.w;
    rayEndWorld /= rayEndWorld.w;

    rayStart = glm::vec3(rayStartWorld);
    rayEnd = glm::vec3(rayEndWorld);
}

//--------------------------------------------------------------
bool ofApp::rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint) {
    glm::vec3 oc = rayStart - sphereCenter;

    float a = glm::dot(rayDir, rayDir);
    float b = 2.0f * glm::dot(oc, rayDir);
    float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;

    float discriminant = b * b - 4 * a * c;

    if (discriminant < 0) {
        return false;
    }
    else {
        float t = (-b - sqrt(discriminant)) / (2.0f * a);
        intersectionPoint = rayStart + t * rayDir;
        return true;
    }
}
```

El vector (std::vector) son una estructura de datos dinámica que gestiona objetos de tipo glm::vec3 o ofVec3f (usado para representar vectores en 3D) (GESTIONA LA RESERVA DE MEMORIA)

fVec3f es una clase en openframework que representa un vector en tres dimensiones: x,y,z. std::vector es un contenedor estandar que permite gestionar estos objetos, que se almacena en el heap (memoria dinámica) cuando crece su capacidad.

almacenamiento: los objetos ofVec3f se almacenan en el HEAP. Un std::vector gestiona automáticamente la memoria dinamica a medida que se aplican mas elementos. esto permite que los datos del vector ofVec3f se almacenen en la memoria dinamica, mientras que el propio objeto std::vector (que contiene punteros y metadata de control) puede estar en el stack o en el heap dependiendo de cómo fue declarado.

gestion de memoria: El std::vector reserva un bloque de memoria continuo para almacenar sus elementos. Si la capacidad se llena y se necesita más espacio, el vector realoca un nuevo bloque mayor, copia los elementos y libera el bloque anterior

Se puede observar que la variable spherePositions (un std::vector) está en el stack si se declara dentro de una función o como parte de la clase ofApp. Sin embargo, los elementos que contiene (ofVec3f) están almacenados en el heap, ya que el vector usa memoria dinámica para almacenar y gestionar sus elementos.

cada ofVec3f añadido al vector es almacenado en una región del heap

Cuando se inserta un nuevo elemento en spherePositions, el depurador muestra cómo la memoria del heap se gestiona dinámicamente. Si el vector necesita más espacio, realoca un nuevo bloque más grande para almacenar los elementos y copia los existentes, liberando el bloque anterior.

se gestionan los objetos ofVec3f dentro de un std::vector, confirmando que el vector está en el stack, mientras que sus elementos están en el heap

S e aprendio que cada objeto ofVec3f en el vector spherePositions se almacena en el heap,

El propio objeto spherePositions, que es un std::vector, se encuentra en el stack si es declarado dentro de una función o como miembro de la clase ofApp. Sin embargo, los elementos que almacena (las instancias de ofVec3f) se encuentran en el heap.

Al añadir nuevas esferas, el depurador muestra cómo el vector se realoca automáticamente cuando necesita más espacio, copiando los elementos a un nuevo bloque en el heap y liberando el bloque anterior. esto para mejorar el rendimiento de la memoria y evitar fugas de mo¿emoria. esta funcion la realiza el std::vector