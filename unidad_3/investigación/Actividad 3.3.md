# Actividad 3.3

- La función mouseMoved contiene la herramienta push_back la cual añadirá una figura por iteración, además de usar un condicional con el fin de borrar la primera particula del vector siempre y cuando su cantidad sea mayor a 100.
- La función mousePressed se elije un color de forma aleatoria para la variable particleColor.
- La función setup el color de fondo y el color inicial de las particulas.
- La función draw contiene un ciclo el cual guarda la posición de la particula actual y le asigna el color que contenga la variable particleColor, para luego imprimirla en la pantalla, con un tamaño determinado, en la ubicación guardada.

Para esta alternativa mantngo el archivo ofApp.h igual, mientras que en el archivo ofApp.cpp, cambio la figura a dibujar en la función draw además de asignarle al fondo una variable de color que cambiará de valor según la función mousePressed.

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
    ofBackground(0);
    particleColor = ofColor::white;
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetColor(backgroundColor);
    ofBackground(backgroundColor);
    for (auto& pos : particles) {
        ofSetColor(particleColor);
		ofDrawTriangle(pos.x, pos.y, pos.x + 20, pos.y + 20, pos.x - 20, pos.y + 20);
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
    particleColor = ofColor(ofRandom(150), ofRandom(150), ofRandom(150));
	backgroundColor = ofColor(ofRandom(150), ofRandom(150), ofRandom(150));
}
```
