# Actividad 2.3

De nuevo una actividad grupal en la cual escribiremos juntos nuestra primera aplicación y analizaremos las diferentes partes que la componen.

- Genera un proyecto con el generador de proyectos de **`openframeworks`**.
- Abre el proyecto en Visual Studio.
- Modifica el archivo `ofApp.h` así:

```cpp
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{

    public:
        void setup();
        void update();
        void draw();

        void mouseMoved(int x, int y );
        void mousePressed(int x, int y, int button);

    private:

        vector<ofVec2f> particles;
        ofColor particleColor;

};
```

- Ahora modifica el archivo `ofApp.cpp` así:

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
    particleColor = ofColor::white;
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    for(auto &pos: particles){
        ofSetColor(particleColor);
        ofDrawCircle(pos.x, pos.y, 50);
    }
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){
    particles.push_back(ofVec2f(x, y));
    if (particles.size() > 100) {
        particles.erase(particles.begin());
    }
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){
    particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}
```

Analicemos juntos este código:

- ¿Qué fue lo que incluimos en el archivo .h?
- ¿Cómo funciona la aplicación?
- ¿Qué hace la función mouseMoved?
- ¿Qué hace la función mousePressed?
- ¿Qué hace la función setup?
- ¿Qué hace la función update?
- ¿Qué hace la función draw?

## Respuestas

* Dentro del archivo .h incluimos 5 metodos con diferentes funcionalidades.
* El programa esta constantemente actualizando la imagen en pantalla en la cual se aparenta la aparición de un trazo circular mientras mueves el cursor, se va borrando a medida que vas trazando despues de alcanzar mas de 100 particulas. Al hacer click en la pantalla las particulas cambiaran de color aleatoriamente.
* La función mouseMoved se actualiza constantemente mientras que el cursor se está moviendo.
* La función mousePressed devuelve un valor al hacer click con el mouse.
* La función setup se activa solo una vez al iniciar el programa, con el fin de presentar las bases del programa.
* La función update se actualiza constantemente sin condiciones.
* La función draw también se actualiza constantemente para imprimir figuras en la pantalla.