# Actividad 7.3

Ahora te voy a proponer que reflexiones profundamente sobre el manejo de la memoria en un programa. Se trata de un experimento en el que tienes que analizar por qué está funcionando mal.

Modifica el archivo `ofApp.h` de la siguiente manera:
#include "ofMain.h"

```cpp
#pragma once

#include "ofMain.h"

class Sphere {
public:
    Sphere(float x, float y, float radius);
    void draw() const;

    float x, y;
    float radius;
    ofColor color;
};

class ofApp : public ofBaseApp {
public:
    void setup();
    void update();
    void draw();

    void keyPressed(int key);

private:
    std::vector<Sphere*> globalVector;
    void createObjectInStack();
};
​
```

Y el archivo ofApp.cpp así:

```cpp

#include "ofApp.h"

Sphere::Sphere(float x, float y, float radius) : x(x), y(y), radius(radius) {
    color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}

void Sphere::draw() const {
    ofSetColor(color);
    ofDrawCircle(x, y, radius);
}

void ofApp::setup() {
    ofBackground(0);
}

void ofApp::update() {
}

void ofApp::draw() {
    ofSetColor(255);
    for (Sphere* sphere : globalVector) {
        if (sphere != nullptr) {
            ofDrawBitmapString("Objects pointed: " + ofToString(globalVector.size()), 20, 20);
            ofDrawBitmapString("Attempting to draw stored object...", 20, 40);
            ofDrawBitmapString("Stored Object Position: " + ofToString(sphere->x) + ", " + ofToString(sphere->y), 20, 60);
            sphere->draw();
        }
    }
}

void ofApp::keyPressed(int key) {
    if (key == 'c') {
        if (globalVector.empty()) {
            createObjectInStack();
        }
    }
    else if (key == 'd') {
        if (!globalVector.empty()) {
            ofLog() << "Accessing object in global vector: Position (" << globalVector[0]->x << ", " << globalVector[0]->y << ")";
        }
        else {
            ofLog() << "No objects in the global vector.";
        }
    }
}

void ofApp::createObjectInStack() {
    Sphere localSphere(ofRandomWidth(), ofRandomHeight(), 30);
    globalVector.push_back(&localSphere);
    ofLog() << "Object created in stack: Position (" << localSphere.x << ", " << localSphere.y << ")";
    localSphere.draw();
}
```

- ¿Qué sucede cuando presionas la tecla “c”?

### Respuesta

Cuando opimes c, se crea localSphere en el stack (memoria válida solo durante la ejecución de createObjectInStack()). su dirección se guarda en globalVector. La función termina y localSphere se destruye automáticamente.

Cuando intentas dibujar los objetos en draw(), el puntero en globalVector apunta a memoria no válida (objeto ya destruido).



- Realiza esta modificación a la función `createObjectInStack` donde claramente se está creando un objeto, pero se está creando en el `heap` y no en el `stack`, así que no te dejes confundir por el nombre de la función.

```cpp
void ofApp::createObjectInStack() {
    // Sphere localSphere(ofRandomWidth(), ofRandomHeight(), 30);
    // globalVector.push_back(&localSphere);
    // ofLog() << "Object created in stack: Position (" << localSphere.x << ", " << localSphere.y << ")";
    // localSphere.draw();
    Sphere* heapSphere = new Sphere(ofRandomWidth(), ofRandomHeight(), 30);
    globalVector.push_back(heapSphere);
    ofLog() << "Object created in heap: Position (" << heapSphere->x << ", " << heapSphere->y << ")";
    heapSphere->draw();
}
```

- ¿Qué sucede cuando presionas la tecla “c”?
- ¿Por qué ocurre esto?

### Respuesta

Al oprimir c, se crea un nuevo objeto Sphere en el heap (memoria dinámica) usando new. Se almacena su puntero en globalVector (ahora sí es válido, porque el objeto persiste en el heap). Se dibuja correctamente (tanto en el log como en pantalla), ya que el objeto sigue existiendo después de que la función termina. Cada vez que presionas "c", se crea una nueva Sphere en el heap y se guarda su dirección en globalVector.

Esto sucede porque la memoria stack elimina automáticamente el nuevo objeto al terminar la función createObjectInStack() y por lo tanto al dibujarla se diríge a un espacio vacío, en cambio en heap, el objeto queda guardado al haber terminado la función y permite a la función draw() llamar al objeto heapSphere correctamente.