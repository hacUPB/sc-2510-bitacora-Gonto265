# Actividad 1.4

En esta actividad vas a experimentar con una aplicación interactiva y listas enlazadas El siguiente código código además incluye la gestión de memoria.

**ofApp.h:**

```cpp
#pragma once
#include "ofMain.h"

class Node {
public:
    float x, y;
    Node* next;
    
    Node(float _x, float _y);
    ~Node();
};

class LinkedList {
public:
    Node* head;
    Node* tail;
    int size;

    LinkedList();
    ~LinkedList();
    
    void clear();
    void addNode(float x, float y);
    void update(float x, float y);
    void display();
};

class ofApp : public ofBaseApp {
public:
    LinkedList snake;
    void setup();
    void update();
    void draw();
    void keyPressed(int key);  // Nueva función para manejar el teclado
};
```

**ofApp.cpp:**

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
    // Añadir nodos a la serpiente
    ofBackground(255, 255, 255);
    for (int i = 0; i < 10; i++) {
        snake.addNode(ofGetWidth() / 2, ofGetHeight() / 2);
    }
}
//--------------------------------------------------------------
void ofApp::update() {
    // Actualizar la posición de la serpiente
    snake.update(ofGetMouseX(), ofGetMouseY());
}
//--------------------------------------------------------------
void ofApp::draw() {
    ofBackground(220);
    // Dibujar la serpiente
    snake.display();
}
//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
    if (key == 'c') {
        snake.clear();  // Limpiar explícitamente la lista cuando se presiona la tecla 'c'
    }
}
//--------------------------------------------------------------

LinkedList::LinkedList() {
    head = new Node(ofGetWidth() / 2, ofGetHeight() / 2);
    tail = head;
    size = 1;
}
//--------------------------------------------------------------
LinkedList::~LinkedList() {
    clear();
}
//--------------------------------------------------------------
void LinkedList::clear() {
    Node* current = head;
    while (current != nullptr) {
        Node* nextNode = current->next;
        delete current;
        current = nextNode;
    }
    head = nullptr;
    tail = nullptr;
    size = 0;
}
//--------------------------------------------------------------
void LinkedList::addNode(float x, float y) {
    Node* newNode = new Node(x, y);
    if (tail != nullptr) {
        tail->next = newNode;
        tail = newNode;
    } else {
        head = tail = newNode;
    }
    size++;
}
//--------------------------------------------------------------
void LinkedList::update(float x, float y) {
    Node* current = head;
    float prevX = x;
    float prevY = y;

    while (current != nullptr) {
        float tempX = current->x;
        float tempY = current->y;
        current->x = prevX;
        current->y = prevY;
        prevX = tempX;
        prevY = tempY;
        current = current->next;
    }
}
//--------------------------------------------------------------
void LinkedList::display() {
    Node* current = head;
    while (current != nullptr) {
        ofSetColor(ofColor(255,0,0));
        ofDrawCircle(current->x, current->y, 10);
        current = current->next;
    }
}
//--------------------------------------------------------------
Node::Node(float _x, float _y) {
    x = _x;
    y = _y;
    next = nullptr;
}
//--------------------------------------------------------------
Node::~Node() {
    // Destructor para Node (si hay recursos adicionales)
}
```

Gestión de memoria: se maneja explícitamente la liberación de memoria mediante la función `clear()`. Nota que también se llama a clear en el destructor de la clase LinkedList para asegurar que la memoria se libere cuando el objeto se destruye.

Vas a reportar en tu bitácora de aprendizaje:

1. **Entiende la aplicación**: comienza explorando detenidamente cómo funciona el programa. Usa un un modelo del lenguaje como ChatGPT y el depurador para que verifiques las explicaciones que te propone ChatGPT. Puedes escribir el prompt: quiere entender de manera muy detallada el siguiente programa escrito en C++ y el openframeworks. Luego le das el código. Ve preguntando lo que no entiendas. recuerda ir usando al mismo tiempo el depurador de visual studio.
2. **Realiza evaluaciones formativas**. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.
3. ¿Qué es una lista enlazada y en qué se diferencia de un arreglo en cuanto a la forma en que los elementos están almacenados en la memoria?
4. Al observar el código de una lista enlazada en C++, ¿Cómo crees que se vinculan los nodos entre sí? ¿Qué estructura se utiliza para lograr esta conexión?
5. ¿Cómo se gestiona la memoria en una lista enlazada? Investiga cómo se crea y se destruye un nodo en memoria utilizando el operador new y delete en C++.
6. Considerando la estructura de una lista enlazada, ¿qué ventajas ofrece en comparación con un arreglo cuando se trata de insertar o eliminar elementos en posiciones intermedias?
7. En el código presentado, ¿Cómo se asegura que no haya fugas de memoria? ¿Qué papel juega el destructor en la clase LinkedList?
8. ¿Qué sucede en la memoria cuando se invoca el método clear() en una lista enlazada? Explica paso a paso cómo se liberan los recursos.
9. Explica cómo cambia la estructura en memoria de una lista enlazada al agregar un nuevo nodo al final de la lista. ¿Cómo afecta esto al rendimiento de la lista enlazada?
10. Analiza una situación en la que utilizar una lista enlazada sería más ventajoso que utilizar un arreglo. Justifica tu respuesta considerando la gestión de memoria y las operaciones de inserción y eliminación.
11. Después de estudiar el manejo de memoria en listas enlazadas, ¿Cómo aplicarías este conocimiento para diseñar una estructura de datos personalizada para una aplicación creativa? ¿Qué aspectos considerarías para asegurar la eficiencia y evitar fugas de memoria?
12. Reflexiona sobre las diferencias en la gestión de memoria entre C++ y un lenguaje con recolección de basura automática como C#. ¿Qué ventajas y desafíos encuentras en la gestión explícita de memoria en C++ al trabajar con estructuras de datos?
13. Imagina que estás optimizando una pieza de arte generativo que usa listas enlazadas para representar elementos en movimiento. ¿Qué consideraciones tomarías en cuenta para garantizar que la gestión de la memoria sea eficiente y que no ocurran fugas de memoria?
14. **Pruebas:** pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas.

## Respuesta

1. El código implementa una serpiente (snake) usando una lista enlazada. Los nodos son cada segmento de la serpiente. Tienen coordenadas (x, y) y puntero next para enlazar nodos.

LinkedList gestiona el cuerpo de la serpiente, con punteros head (inicio) y tail (final). Métodos para añadir nodos (addNode), mover la serpiente (update), dibujar (display), y liberar memoria (clear).

- El metodo setup() nicializa 10 nodos centrados.

- El metodo update() mueve la cabeza hacia el ratón y actualiza las posiciones del resto de nodos (cada nodo toma la posición del anterior).

- El metodo draw() dibuja cada nodo como un círculo rojo.

- El metodo keyPressed() limpia la lista al presionar 'c'.

Los nodos se crean con new (en el heap) y se liberan en clear() y el destructor ~LinkedList() asegura que toda la memoria se libere al terminar.

2. :thumbsup:

3. 
**Lista enlazada:**

Los elementos (nodos) se almacenan en posiciones no contiguas de memoria, cadada nodo contiene datos + un puntero al siguiente nodo y tienen tamaño dinámico (crece o reduce según necesidad).

**Arreglo:**

Almacenamiento contiguo en memoria, tamaño fijo (o redimensionamiento costoso) y tiene acceso rápido por índices, pero inserción/eliminación ineficientes.

La lista enlazada usa punteros para conectar nodos, mientras que un arreglo usa direcciones de memoria secuenciales.

4. Cada nodo (Node) tiene un puntero next que apunta al siguiente nodo.

5. Gestión de memoria con new y delete
Creación de nodos:

```cpp
Node* newNode = new Node(x, y); // Asigna memoria en el heap
```

Destrucción de nodos:

```cpp
delete node; // Libera la memoria del nodo
```
6. 

**Lista enlazada:**

Inserción/eliminación en tiempo constante (O(1)) si es en la cabeza/cola y no requiere desplazar elementos (solo ajustar punteros).

**Arreglo:**

Inserción/eliminación en O(n) (debe desplazar elementos).

7. 

**Destructor ~LinkedList():**

```cpp
~LinkedList() { clear(); } // Llama a clear() al destruir la lista
```

**Método clear():**

Recorre la lista liberando cada nodo con delete.

8. 
- Inicia en head y recorre cada nodo.

- Guarda el next del nodo actual.

- Libera el nodo con delete.

- Avanza al siguiente nodo guardado.

- Al terminar, head y tail se ponen a nullptr.

9. 

**Agregar un nodo:**

- Se crea un nuevo nodo.

- tail->next apunta al nuevo nodo.

- tail se actualiza al nuevo nodo.

**Rendimiento:**

- Inserción al final es O(1) (si se guarda tail).

- Sin tail, sería O(n) (hay que recorrer toda la lista).

10. 

**Ejemplo:** Un editor de texto que permite deshacer/rehacer acciones.

**Ventajas de la lista enlazada:**

- Inserción/eliminación rápida de acciones (como nodos).

- No requiere memoria contigua (crece según necesidad).

**Arreglo sería ineficiente:**

- Cada acción nueva requeriría desplazar elementos.

11. 

**Consideraciones:**

- Usar smart pointers (unique_ptr, shared_ptr) para evitar delete manual.

- Mantener un balance entre flexibilidad y rendimiento (evitar recorridos innecesarios).

- Implementar destructores que liberen recursos.

**Ejemplo:**

Una simulación de partículas donde cada partícula es un nodo en una lista.

12. 

**C++:**

**Ventaja:** Control total sobre memoria (eficiencia en tiempo real).

**Desventaja:** Riesgo de fugas si no se libera memoria manualmente.

**C#:**

**Ventaja:** Recolección automática (menos errores).

**Desventaja:** Incertidumbre en el momento de liberación (puede afectar rendimiento).

13. 
**Estrategias:**

**Pool de nodos:** Reutilizar nodos en lugar de crear/eliminar frecuentemente.

**Listas circulares:** Para efectos de movimiento continuo.

**Perfilación de memoria:** Usar herramientas como Valgrind para detectar fugas.

14. :thumbsup: