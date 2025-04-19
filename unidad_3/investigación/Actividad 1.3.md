# Actividad 1.3

Para verificar que todo quedó correctamente instalado, vamos a realizar un pequeño ejercicio modificando ligeramente el archivo `ofApp.cpp` que se genera por defecto:

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetColor(255);
    ofDrawCircle(ofGetMouseX(), ofGetMouseY(), 20);
}
```

- ¿Cuál es el resultado que se obtiene al ejecutar este programa?

### Respuesta

Se obtiene que dentro del programa se genera un circulo blanco repetidamente en la posición actual del cursor, lo cual crea la sensación de que el circulo está constantemente moviendose junto con el cursor.