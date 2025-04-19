# Reto 1.4

Crea una obra de arte generativo dinámica (con gestión de memoria). Utilizando los conceptos de arreglos, listas enlazadas, pilas y colas, crea una obra de arte generativo dinámica. Asegúrate de gestionar el ciclo de vida de todos los objetos creados dinámicamente.

Requisitos
Combinación de estructuras de datos: usa al menos un arreglo o lista enlazada y una pila o cola para gestionar diferentes aspectos de tu obra (por ejemplo, la posición y color de los elementos, la velocidad de movimiento, etc.).

Interactividad: implementa al menos una forma de interacción con el usuario, que cambie la visualización o el comportamiento de la obra.

Gestión de memoria: asegúrate de liberar la memoria de todos los objetos creados dinámicamente.

Preguntas para guiar el proceso
Exploración creativa: ¿Qué tipo de efecto visual quieres lograr? ¿Cómo pueden ayudarte las diferentes estructuras de datos a lograr ese efecto?
busco dar un efecto visual de particulas, que llame estrellas, que esten en movimiento a traves de la pantalla. durante esto el usuario podra eliminar y agregar estrellas

colas- al momento de eliminar las particulas, la mas antigua sera la primera en eliminarce

Gestión de memoria: ¿Qué consideraciones debes tener en cuenta al gestionar dinámicamente la memoria de los objetos? ¿Cómo asegurar que no haya fugas de memoria?
Liberar cada objeto: Cada nodo o partícula que cree debe ser liberado cuando ya no sea necesario. Implementar destructores en las clases de estructura de datos (como Stack o LinkedList) asegurará que todos los elementos dinámicos se liberen correctamente.

Desapilar o desenlazar de manera segura: En el caso de la pila o lista enlazada, debo asegurarme de que cada nodo se desapile y libere adecuadamente sin perder referencias en la estructura, pues podría causar fugas.

Interacción y dinamismo: ¿Cómo puedes hacer que la interacción del usuario influya en múltiples estructuras de datos simultáneamente para crear un efecto visual coherente y dinámico?
Teclas para modificar estados: Asignar teclas específicas para diferentes interacciones (como a para agregar una partícula y d para eliminarla) que afecten tanto la cola (para el orden y superposición de partículas)

Optimización: ¿Qué técnicas puedes implementar para optimizar la gestión de memoria y el rendimiento de tu aplicación mientras mantienes una experiencia visual rica y fluida?

ofApp.h

```cpp
#pragma once

#include "ofMain.h"
#include <queue>
#include <list>

class Star {
public:
    ofVec2f position;  // Posición
    ofColor color;     // Color
    float size;        // Tamaño
    ofVec2f velocity;  // Velocidad

    Star(float x, float y, ofColor color) {
        position.set(x, y);
        this->color = color;
        this->size = ofRandom(5, 20);
        velocity.set(ofRandom(-1, 1), ofRandom(-1, 1));
    }

    void update() {
        position += velocity;
        // Limitar las estrellas a la pantalla
        if (position.x < 0 || position.x > ofGetWidth()) velocity.x *= -1;
        if (position.y < 0 || position.y > ofGetHeight()) velocity.y *= -1;
    }

    void draw() {
        ofSetColor(color);
        ofDrawCircle(position.x, position.y, size);
    }
};

class ofApp : public ofBaseApp {
public:
    std::queue<Star*> starQueue;  // Cola para almacenar estrellas
    std::list<Star*> starLinkedList; // Lista enlazada para conectar estrellas
    std::vector<ofColor> colorArray;     // Arreglo de colores

    void setup();
    void update();
    void draw();
    void keyPressed(int key);
    void addStar();
    void removeOldestStar();
    void connectStars();
    void clearStars();  // Limpia y libera la memoria de las estrellas
    ~ofApp();               // Destructor para liberar memoria
};
```

ofApp.cpp

```cpp
#include "ofApp.h"

void ofApp::setup() {
    ofSetBackgroundColor(0);

    // Inicializar arreglo de colores
    colorArray.push_back(ofColor::yellow);
    colorArray.push_back(ofColor::white);
    colorArray.push_back(ofColor::cyan);
    colorArray.push_back(ofColor::orange);
    colorArray.push_back(ofColor::blue);
}

void ofApp::update() {
    // Actualizar todas las estrellas en la cola
    std::queue<Star*> tempQueue = starQueue;  // Crear una copia temporal de la cola
    while (!tempQueue.empty()) {
        Star* star = tempQueue.front();
        star->update();
        tempQueue.pop();
    }

    // Conectar las estrellas cercanas
    connectStars();
}

void ofApp::draw() {
    // Dibujar todas las estrellas de la cola
    std::queue<Star*> tempQueue = starQueue;  // Crear una copia temporal de la cola
    while (!tempQueue.empty()) {
        Star* star = tempQueue.front();
        star->draw();
        tempQueue.pop();
    }
}

void ofApp::keyPressed(int key) {
    if (key == 'a') {  // Agregar una estrella
        addStar();
    }
    else if (key == 'd') {  // Eliminar la estrella más antigua
        removeOldestStar();
    }
}

void ofApp::addStar() {
    float x = ofRandomWidth();
    float y = ofRandomHeight();
    // Seleccionar color aleatorio del arreglo
    ofColor color = colorArray[ofRandom(colorArray.size())];
    Star* star = new Star(x, y, color);
    starQueue.push(star);  // Agregar estrella a la cola
    starLinkedList.push_back(star);  // Añadir a la lista enlazada para conectar estrellas
}

void ofApp::removeOldestStar() {
    if (!starQueue.empty()) {
        // Eliminar la estrella más antigua (el primer elemento de la cola)
        Star* star = starQueue.front();
        delete star;  // Liberar memoria de la estrella
        starQueue.pop();  // Eliminar la estrella de la cola

        // Eliminar también de la lista enlazada
        auto it = std::find(starLinkedList.begin(), starLinkedList.end(), star);
        if (it != starLinkedList.end()) {
            starLinkedList.erase(it);  // Eliminar la estrella de la lista enlazada
        }
    }
}

void ofApp::connectStars() {
    // Conectar las estrellas cercanas
    for (auto it1 = starLinkedList.begin(); it1 != starLinkedList.end(); ++it1) {
        for (auto it2 = std::next(it1); it2 != starLinkedList.end(); ++it2) {
            ofSetColor(255, 255, 255, 50);
            ofDrawLine((*it1)->position, (*it2)->position);  // Conectar las estrellas cercanas
        }
    }
}

void ofApp::clearStars() {
    while (!starQueue.empty()) {
        Star* star = starQueue.front();
        delete star;  // Liberar memoria
        starQueue.pop();
    }
}

ofApp::~ofApp() {
    clearStars();  // Asegurar que toda la memoria se libere al salir
}
```

### implementacion de estructuras

se utiliza un arreglo (std::vector) para almacenar los diferentes colores que se asignan a las estrellas al crearse. Este vector permite acceder rápidamente a los colores y elegir uno al azar para cada estrella, añadiendo variedad visual al proyecto.

La cola (std::queue) es utilizada para almacenar las estrellas en el orden en el que se crean, lo que facilita eliminar las estrellas más antiguas primero

**creacion de objetos:** Cada vez que se añade una nueva estrella, el programa usa new para crear dinámicamente una instancia de la clase Star en el heap. Esto se realiza en el método addStar(), que se llama cuando el usuario quiere agregar una nueva estrella.

**Liberación de Memoria:** se realiza usando delete para cada objeto Star que ya no es necesario. La liberación de memoria ocurre en el método removeOldestStar() y en clearStars() al final de la ejecución.

Para asegurarse de que no queden objetos Star sin liberar cuando el programa termine, se llama a un método clearStars() en el destructor de ofApp. Este método recorre la cola starQueue y libera la memoria de cada estrella restante.

**Destructor ~ofApp():** Llama a clearStars() para asegurar que se liberen todos los recursos dinámicamente asignados cuando la aplicación termine.