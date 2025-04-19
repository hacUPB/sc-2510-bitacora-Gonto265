# Actividad 9.3
Considera el siguiente código. El archivo ofApp.h es el siguiente:

```cpp
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{
public:
    void setup();
    void update();
    void draw();

    void keyPressed(int key);
    void mousePressed(int x, int y, int button);

private:
    vector<ofVec2f*> heapObjects;
};

Y el archivo ofApp.cpp es el siguiente:
#include "ofApp.h"

void ofApp::setup(){
    ofBackground(0);
}

void ofApp::update(){
}

void ofApp::draw(){
    ofSetColor(0, 0, 255); // Color azul para los objetos del heap
    for(auto& pos : heapObjects) {
        ofDrawCircle(pos->x, pos->y, 20);
        ofDrawBitmapString("Heap Memory", pos->x - 40, pos->y - 40);
    }
}

void ofApp::keyPressed(int key){
    if(key == 'f') {
        if(!heapObjects.empty()) {
            delete heapObjects.back();
            heapObjects.pop_back();
        }
    }
}

void ofApp::mousePressed(int x, int y, int button){
    heapObjects.push_back(new ofVec2f(x, y));
}
```

- ¿Qué sucede cuando presionas la tecla “f”?
- Analiza detalladamente esta parte del código:

```cpp
if(!heapObjects.empty()) {
    delete heapObjects.back();
    heapObjects.pop_back();
}
```
## Respuesta
- Al oprimir f borra el último objeto creado en el heap (memoria dinámica), elimina su puntero del vector heapObjects para evitar acceso inválido, sin embargo, si no hay objetos (heapObjects.empty() == true), no hace nada.

- 
    1. `if(!heapObjects.empty())`: Verifica si el vector heapObjects tiene elementos.

    2. `delete heapObjects.back()`: `heapObjects.back()`, devuelve un puntero al último ofVec2f almacenado en el vector. `delete` libera la memoria asignada con new (evitando un memory leak).

    3. `heapObjects.pop_back()`: Elimina el puntero (no el objeto) del vector.