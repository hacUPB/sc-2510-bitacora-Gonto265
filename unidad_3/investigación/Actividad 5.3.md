# Actividad 5.3

En la unidad anterior introdujimos el concepto de puntero. Ahora vamos a profundizar en este concepto de manera práctica.

El siguiente ejemplo se supone (en la actividad que sigue vas a corregir un error) que te permite seleccionar una esfera y moverla con el mouse.

Modifica el archivo `ofApp.h` de la siguiente manera:

```cpp
#pragma once

#include "ofMain.h"

class Sphere {
public:
    Sphere(float x, float y, float radius);
    void draw();
    void update(float x, float y);
    float getX();
    float getY();
    float getRadius();

private:
    float x, y;
    float radius;
    ofColor color;
};

class ofApp : public ofBaseApp{

    public:
        void setup();
        void update();
        void draw();

        void mouseMoved(int x, int y );
        void mousePressed(int x, int y, int button);

    private:

        vector<Sphere*> spheres;
        Sphere* selectedSphere;
};
```

Y el archivo `ofApp.cpp` así:

```cpp
#include "ofApp.h"

Sphere::Sphere(float x, float y, float radius) : x(x), y(y), radius(radius) {
    color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}

void Sphere::draw() {
    ofSetColor(color);
    ofDrawCircle(x, y, radius);
}

void Sphere::update(float x, float y) {
    this->x = x;
    this->y = y;
}

float Sphere::getRadius() {
    return radius;
}

float Sphere::getX() {
    return x;
}

float Sphere::getY() {
    return y;
}

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);

    for (int i = 0; i < 5; i++) {
        float x = ofRandomWidth();
        float y = ofRandomHeight();
        float radius = ofRandom(20, 50);
        spheres.push_back(new Sphere(x, y, radius));
    }
    selectedSphere = nullptr;

}

//--------------------------------------------------------------
void ofApp::update(){
    if (selectedSphere != nullptr) {
        selectedSphere->update(ofGetMouseX(), ofGetMouseY());
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    for (auto sphere : spheres) {
        sphere->draw();
    }
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

    if(button == OF_MOUSE_BUTTON_LEFT){
        for (auto sphere : spheres) {
            float distance = ofDist(x, y, sphere->getX(), sphere->getY());
            if (distance < sphere->getRadius()) {

                selectedSphere = sphere;
                break;
            }
        }
    }
}
```

- ¿Cuál es la definición de un puntero?
- ¿Dónde está el puntero?
- ¿Cómo se inicializa el puntero?
- ¿Para qué se está usando el puntero?
- ¿Qué es exactamente lo que está almacenado en el puntero?

### Respuestas

- Un puntero es una variable que almacena la dirección de memoria de otra variable.

- En la clase ofApp, la variable selectedSphere es un puntero que apunta a un objeto de tipo Sphere. Además, en el vector vector<Sphere*> spheres, cada elemento del vector es un puntero a un objeto de tipo Sphere.

- El puntero selectedSphere se inicializa en el método setup() como nullptr, indicando que al principio no apunta a ningún objeto. Los elementos del vector spheres se inicializan con instancias de objetos Spheres creadas con new.

- El puntero selectedSphere se usa para guardar la referencia al objeto Sphere seleccionado por el usuario al hacer clic con el botón izquierdo del mouse. Esto permite mover ese objeto específico con el movimiento del mouse en el método update().
Por otro lado, el vector spheres almacena los punteros a las diferentes instancias de las esferas que se crean en el método setup(). Estos punteros permiten interactuar con las esferas (como dibujarlas y comprobar colisiones) sin copiar los objetos.

- El puntero almacena la dirección de memoria donde se encuentra el objeto al que apunta. En este caso, selectedSphere almacena la direccíon de memoria de una instancia de Sphere,es decir,el objeto seleccionado por el usuario. Mientras que, cada punteroen el vector spheres almacena la dirección de memoria de una instacia de Sphere creada dinámicamente.  Esto asegura que las operaciones realizadas sobre los punteros afectan directamente a los objetos en memoria, sin necesidad de duplicar los datos. 


