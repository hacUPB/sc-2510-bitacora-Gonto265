# Actividad 8.3

Construye un experimento (un programa) en el que puedas crear y dibujar objetos que se almacenan:

- En el `heap`.
- En el `stack`.
- En memoria global.

<aside>
🔥

**Nota**
sí puedes usar el `stack,`pero recuerda que los objetos solo dudarán en el `stack` el tiempo que dure la función que los creó. ¿Hay alguna función en el programa que dure durante toda la ejecución del programa?

</aside>

- ¿Cuándo debo crear objetos en el `heap` y cuándo en memoria global?

### Respuesta

En ofApp.h:

```cpp
#pragma once
#include "ofMain.h"

class Ball {
public:
    Ball(float x, float y, float radius, ofColor color);
    void draw() const;

    float x, y, radius;
    ofColor color;
};

class ofApp : public ofBaseApp {
public:
    ofApp();
    void setup();
    void update();
    void draw();

    void keyPressed(int key);

private:
    // Memoria Global (vive durante todo el programa)
    Ball globalBall;

    // Heap (memoria dinámica)
    std::vector<Ball*> heapBalls;

    // Stack (memoria automática, se destruye al salir de la función)
    void createStackBall();
};
```

En ofApp.cpp

```cpp
#include "ofApp.h"

Ball::Ball(float x, float y, float radius, ofColor color)
    : x(x), y(y), radius(radius), color(color) {
}

void Ball::draw() const {
    ofSetColor(color);
    ofDrawCircle(x, y, radius);
}

// Inicialización de la bola global (memoria global)
ofApp::ofApp() : globalBall(100, 100, 30, ofColor::red) {}

void ofApp::setup() {
    ofBackground(0);
}

void ofApp::update() {}

void ofApp::draw() {
    // Dibujar la bola global
    globalBall.draw();
    ofDrawBitmapString("Global Ball", globalBall.x - 20, globalBall.y - 40);

    // Dibujar bolas del heap
    for (Ball* ball : heapBalls) {
        if (ball) {
            ball->draw();
            ofDrawBitmapString("Heap Ball", ball->x - 20, ball->y - 40);
        }
    }
}

void ofApp::keyPressed(int key) {
    if (key == 'h') {
        // Crear una bola en el heap
        Ball* newBall = new Ball(
            ofRandomWidth(),
            ofRandomHeight(),
            30,
            ofColor(ofRandom(255), ofRandom(255), ofRandom(255))
        );
        heapBalls.push_back(newBall);
        ofLog() << "Heap Ball creada en: (" << newBall->x << ", " << newBall->y << ")";
    }
    else if (key == 's') {
        // Crear una bola en el stack (se destruirá al terminar la función)
        createStackBall();
    }
    else if (key == 'd') {
        // Limpiar el heap (evitar memory leak)
        for (Ball* ball : heapBalls) {
            delete ball;
        }
        heapBalls.clear();
        ofLog() << "Heap Balls eliminadas!";
    }
}

void ofApp::createStackBall() {
    // Bola en el stack (solo existe dentro de esta función)
    Ball stackBall(
        ofRandomWidth(),
        ofRandomHeight(),
        30,
        ofColor(ofRandom(255), ofRandom(255), ofRandom(255))
    );
    ofLog() << "Stack Ball creada en: (" << stackBall.x << ", " << stackBall.y << ")";
    stackBall.draw(); // Se dibuja, pero luego se destruye
}
```
- Debo usar **heap** cuando necesite crear o destruir objetos dinámicamente (ej. en tiempo de ejecución). También cuando el número de objetos es impredecible (ej. enemigos en un juego) o si necesito control preciso de la vida del objeto (creación/eliminación manual).	
 
- Debo usar la **memoria** global cuando necesite un objeto único que viva siempre (ej. configuración del juego). O cuando el objeto debe ser accesible desde cualquier parte sin pasarlo como parámetro. También si el objeto siempre debe existir.