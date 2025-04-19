# Actividad 2.4

En esta actividad vas a experimentar con pilas y colas en un contexto de arte generativo. El código incluye la gestión de memoria.

El código para la pila es este:

**ofApp.h:**

```cpp
#pragma once

#include "ofMain.h"

class Node {
public:
    ofVec2f position;
    Node* next;

    Node(float x, float y) {
        position.set(x, y);
        next = nullptr;
    }
};

class Stack {
public:
    Node* top;

    Stack() {
        top = nullptr;
    }

    ~Stack() {
        clear();
    }

    void push(float x, float y) {
        Node* newNode = new Node(x, y);
        newNode->next = top;
        top = newNode;
    }

    void pop() {
        if (top != nullptr) {
            Node* temp = top;
            top = top->next;
            delete temp;  // Liberar memoria del nodo eliminado
        }
    }

    void clear() {
        while (top != nullptr) {
            pop();
        }
    }

    void display() {
        Node* current = top;
        while (current != nullptr) {
            ofDrawCircle(current->position.x, current->position.y, 20);
            current = current->next;
        }
    }
};

class ofApp : public ofBaseApp {

public:
    Stack circleStack;

    void setup();
    void update();
    void draw();
    void keyPressed(int key);
};
```

**ofApp.cpp:**

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
    ofSetBackgroundColor(220);
}

//--------------------------------------------------------------
void ofApp::update() {

}

//--------------------------------------------------------------
void ofApp::draw() {
    // Dibujar todos los círculos en la pila
    circleStack.display();
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
    if (key == 'a') { // Apilar un nuevo círculo
        circleStack.push(ofGetMouseX(), ofGetMouseY());
    }
    else if (key == 'd') { // Desapilar el último círculo
        circleStack.pop();
    }
}
```

El código para la cola es este:

**ofApp.h:**

```cpp
#pragma once

#include "ofMain.h"

class Node {
public:
    ofVec2f position;
    Node* next;

    Node(float x, float y) {
        position.set(x, y);
        next = nullptr;
    }
};

class Queue {
public:
    Node* front;
    Node* rear;

    Queue() {
        front = rear = nullptr;
    }

    ~Queue() {
        clear();
    }

    void enqueue(float x, float y) {
        Node* newNode = new Node(x, y);
        if (rear == nullptr) {
            front = rear = newNode;
        }
        else {
            rear->next = newNode;
            rear = newNode;
        }
    }

    void dequeue() {
        if (front != nullptr) {
            Node* temp = front;
            front = front->next;
            if (front == nullptr) {
                rear = nullptr;
            }
            delete temp;  // Liberar memoria del nodo eliminado
        }
    }

    void clear() {
        while (front != nullptr) {
            dequeue();
        }
    }

    void display() {
        Node* current = front;
        while (current != nullptr) {
            ofDrawCircle(current->position.x, current->position.y, 20);
            current = current->next;
        }
    }
};

class ofApp : public ofBaseApp {

public:
    Queue circleQueue;

    void setup();
    void update();
    void draw();
    void keyPressed(int key);
};
```

**ofApp.cpp:**

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
    ofSetBackgroundColor(220);
}

//--------------------------------------------------------------
void ofApp::update() {

}

//--------------------------------------------------------------
void ofApp::draw() {
    // Dibujar todos los círculos en la cola
    circleQueue.display();
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
    if (key == 'a') { // Encolar un nuevo círculo
        circleQueue.enqueue(ofGetMouseX(), ofGetMouseY());
    }
    else if (key == 'd') { // Desencolar el primer círculo
        circleQueue.dequeue();
    }
}
```

Gestión de memoria: se maneja explícitamente la liberación de memoria mediante las funciones clear(). Nota que también se llama a clear() en el destructor de las clases Stack y Queue para asegurar que la memoria se libere cuando los objetos se destruyen.

Vas a reportar en tu bitácora de aprendizaje:

1. **Entendiendo la aplicación**: comienza explorando detenidamente cómo funciona el programa. Usa un un modelo del lenguaje como ChatGPT y el depurador para que verifiques las explicaciones que te propone ChatGPT. Puedes escribir el prompt: quiere entender de manera muy detallada el siguiente programa escrito en C++ y el openframeworks. Luego le das el código. Ve preguntando lo que no entiendas. recuerda ir usando al mismo tiempo el depurador de visual studio.
2. **Realiza evaluaciones formativas**. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.
3. **Pruebas:** pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas.

Preguntas de reflexión para el stack:

1. ¿Cómo se gestiona la memoria en una implementación manual de un stack en C++? Reflexiona sobre cómo el uso de new y delete en la creación y destrucción de nodos afecta el rendimiento y la seguridad de tu programa.
2. ¿Por qué es importante liberar la memoria cuando se desapila un nodo en un stack? Considera las consecuencias de no liberar memoria en términos de fugas de memoria y cómo esto puede impactar aplicaciones de largo tiempo de ejecución.
3. ¿Qué diferencias existen entre usar un stack de la STL (std::stack) y crear un stack manualmente? Explora cómo la abstracción que proporciona la STL puede simplificar la implementación, pero también cómo una implementación manual ofrece mayor control sobre la gestión de recursos.
4. ¿Cómo afecta la estructura de un stack al orden de acceso y eliminación de elementos? Analiza cómo la naturaleza LIFO (Last In, First Out) del stack influye en los tipos de problemas que esta estructura de datos puede resolver eficientemente.
5. ¿Cómo podrías modificar el stack para almacenar tipos de datos más complejos (e.g., objetos con múltiples atributos) sin causar problemas de memoria? Reflexiona sobre cómo gestionar adecuadamente la memoria para objetos más complejos y cómo esto afectaría tu implementación actual.

Preguntas de autoevaluación:

1. ¿Puedo explicar detalladamente cómo funciona el proceso de apilar y desapilar nodos en un stack, incluyendo la gestión de memoria?
2. ¿Soy capaz de identificar y corregir una fuga de memoria en una implementación de stack manual?
3. ¿Puedo modificar el stack para que incluya una función que busque un elemento específico, sin alterar el orden de los elementos apilados?
4. ¿Entiendo cómo la estructura LIFO del stack afecta el flujo de datos y puedo dar ejemplos de problemas que se resuelvan mejor con un stack?
5. ¿Puedo implementar y depurar un stack para tipos de datos más complejos, asegurándome de que no haya fugas de memoria ni errores de puntero?

Preguntas de reflexión para la queue:

1. ¿Cómo se maneja la memoria en una implementación manual de una queue en C++? Reflexiona sobre cómo se gestionan los nodos al encolar y desencolar elementos y las implicaciones en términos de eficiencia y seguridad.
2. ¿Qué desafíos específicos presenta la implementación de una queue en comparación con un stack en términos de gestión de memoria? Considera las diferencias en el manejo de punteros front y rear, y cómo estos afectan el proceso de encolado y desencolado.
3. ¿Cómo afecta la estructura FIFO (First In, First Out) de una queue a su uso en diferentes tipos de problemas? Analiza cómo la estructura FIFO influye en la resolución de problemas donde el orden de procesamiento es crucial, como en sistemas de colas de espera.
4. ¿Cómo podrías implementar una queue circular y cuál sería su ventaja respecto a una queue lineal en términos de uso de memoria? Reflexiona sobre cómo una queue circular puede mejorar la eficiencia en ciertos contextos y qué cambios serían necesarios en la implementación.
5. ¿Qué problemas podrían surgir si no se gestionan correctamente los punteros front y rear en una queue, y cómo podrías evitarlos? Considera posibles errores como la pérdida de referencias a nodos y cómo una gestión cuidadosa de los punteros puede prevenir estos problemas.

Preguntas de autoevaluación:

1. ¿Puedo explicar claramente el proceso de encolar y desencolar nodos en una queue, incluyendo la gestión de memoria?
2. ¿Soy capaz de identificar y corregir problemas relacionados con la gestión de los punteros front y rear en una queue?
3. ¿Puedo modificar la queue para implementar una queue circular, entendiendo cómo esto afectaría la gestión de memoria?
4. ¿Entiendo cómo la estructura FIFO de una queue afecta el flujo de datos y puedo dar ejemplos de problemas que se resuelvan mejor con una queue?
5. ¿Puedo implementar y depurar una queue para tipos de datos más complejos, asegurándome de que no haya fugas de memoria ni errores de puntero?

## Respuesta

### Respuestas sobre Pilas y Colas

1. 

**Creación (new):** Cada nodo se aloja en el heap con new Node(x, y).

**Rendimiento:** Más lento que el stack (memoria automática) por la sobrecarga de asignación dinámica.

**Liberación (delete):** En pop(), se libera el nodo con delete para evitar fugas.

**Seguridad:** Si no se libera, hay memory leaks (acumulación de memoria no usada).

2. 
**Consecuencias de no liberar:**

- **Fugas de memoria:** El programa consume más RAM de la necesaria.

- **Crash en larga ejecución:** Si el heap se agota, el programa falla.

- **Impacto en arte generativo:** En aplicaciones que crean/eliminan nodos constantemente (ej: partículas), las fugas son catastróficas.

3. 
**STL (std::stack)**

Gestiona memoria automáticamente.Menos código, más seguro.Optimizado para rendimiento general.	

**Implementación manual**

Control total sobre new/delete.	
Riesgo de fugas si no se libera memoria.
Puede optimizarse para casos específicos.

4. 

**Útil para:**

- **Deshacer acciones**: (el último elemento apilado es el primero en eliminarse). 

- **Recorrido de árboles** (ej: DFS en grafos).

**Inconveniente:** No permite acceso aleatorio (solo al top).

5. 

Solución:

Usar destructores en los objetos almacenados:

```cpp
class ComplexObject {
public:
    ofImage texture;
    ~ComplexObject() { texture.clear(); } // Liberar recursos
};
```

1. Gestión de memoria en una queue manual
Encolar (enqueue):

Crea un nodo con new y lo enlaza al rear.

Desencolar (dequeue):

Libera el nodo front con delete.

Riesgos:

Si no se actualizan front y rear correctamente, se pierden nodos (memory leaks).

2. Desafíos vs. Stack
Queue:

Maneja dos punteros (front y rear), aumentando complejidad.

Al desencolar, debe verificarse si front == rear para evitar punteros colgantes.

Stack:

Solo necesita top.

Ejemplo crítico:

cpp
Copy
void dequeue() {
    if (front != nullptr) {
        Node* temp = front;
        front = front->next;
        if (front == nullptr) rear = nullptr; // ¡Importante!
        delete temp;
    }
}
3. Estructura FIFO de la queue
Usos típicos:

Sistemas de turnos: Procesar elementos en orden de llegada.

Buffers de datos (ej: streaming de audio).

Ventaja:

Justicia en el orden de procesamiento.

4. Queue circular
Implementación:

Usar un array fijo y índices head/tail que "roten".

Ventaja:

Reutiliza memoria sin asignaciones dinámicas frecuentes.

Ejemplo:

cpp
Copy
class CircularQueue {
    ofVec2f buffer[100];
    int head = 0, tail = 0;
    void enqueue(ofVec2f pos) {
        buffer[tail] = pos;
        tail = (tail + 1) % 100; // Rotación
    }
};
5. Problemas con punteros front/rear
Errores comunes:

Punteros colgantes: Si front se libera pero no se actualiza rear.

Fugas: Si rear->next no se nulifica al desencolar.

Solución:

Siempre actualizar ambos punteros y verificar condiciones límite.