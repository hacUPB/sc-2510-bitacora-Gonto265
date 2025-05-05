### Sesión 2: análisis de un caso de estudio

Ahora te voy a presentar un caso de estudio que utiliza los patrones de diseño que hemos estudiado. Ten presente que no voy a partir el código en múltiples archivos para que puedas hacer las pruebas y configuración rápidamente, pero en la práctica deberías hacerlo por orden y para favorecer el trabajo en equipo.

ofApp.h:

```cpp
#pragma once

#include "ofMain.h"
#include <vector>
#include <string>

class Observer {
public:
    virtual void onNotify(const std::string& event) = 0;
};

class Subject {
public:
    void addObserver(Observer* observer);
    void removeObserver(Observer* observer);
protected:
    void notify(const std::string& event);
private:
    std::vector<Observer*> observers;
};

class Particle;

class State {
public:
    virtual void update(Particle* particle) = 0;
    virtual void onEnter(Particle* particle) {}
    virtual void onExit(Particle* particle) {}
    virtual ~State() = default;
};

class Particle : public Observer {
public:
    Particle();
    ~Particle();

    void update();
    void draw();
    void onNotify(const std::string& event) override;
    void setState(State* newState);

    ofVec2f position;
    ofVec2f velocity;
    float size;
    ofColor color;

private:
    State* state;
};

class NormalState : public State {
public:
    void update(Particle* particle) override;
    virtual void onEnter(Particle* particle) override;
};

class AttractState : public State {
public:
    void update(Particle* particle) override;
};

class RepelState : public State {
public:
    void update(Particle* particle) override;
};

class StopState : public State {
public:
    void update(Particle* particle) override;
};

class ParticleFactory {
public:
    static Particle* createParticle(const std::string& type);
};

class ofApp : public ofBaseApp, public Subject {
    public:
        void setup();
        void update();
        void draw();
        void keyPressed(int key);
private:
    std::vector<Particle*> particles;
};
```

ofApp.cpp:

```cpp
#include "ofApp.h"

void Subject::addObserver(Observer* observer) {
    observers.push_back(observer);
}

void Subject::removeObserver(Observer* observer) {
    observers.erase(std::remove(observers.begin(), observers.end(), observer), observers.end());
}

void Subject::notify(const std::string& event) {
    for (Observer* observer : observers) {
        observer->onNotify(event);
    }
}

Particle::Particle() {
    // Inicializar propiedades
    position = ofVec2f(ofRandomWidth(), ofRandomHeight());
    velocity = ofVec2f(ofRandom(-0.5f, 0.5f), ofRandom(-0.5f, 0.5f));
    size = ofRandom(2, 5);
    color = ofColor(255);

    state = new NormalState();
}

Particle::~Particle() {
    delete state;
}

void Particle::setState(State* newState) {
    if (state != nullptr) {
        state->onExit(this);
        delete state;
    }
    state = newState;
    if (state != nullptr) {
        state->onEnter(this);
    }
}

void Particle::update() {
    if (state != nullptr) {
        state->update(this);
    }
    // Mantener las partículas dentro de la ventana
    if (position.x < 0 || position.x > ofGetWidth()) velocity.x *= -1;
    if (position.y < 0 || position.y > ofGetHeight()) velocity.y *= -1;
}

void Particle::draw() {
    ofSetColor(color);
    ofDrawCircle(position, size);
}

void Particle::onNotify(const std::string& event) {
    if (event == "attract") {
        setState(new AttractState());
    }
    else if (event == "repel") {
        setState(new RepelState());
    }
    else if (event == "stop") {
        setState(new StopState());
    }
    else if (event == "normal") {
        setState(new NormalState());
    }
}

void NormalState::update(Particle* particle) {
    particle->position += particle->velocity;
}

void NormalState::onEnter(Particle* particle) {
    particle->velocity = ofVec2f(ofRandom(-0.5f, 0.5f), ofRandom(-0.5f, 0.5f));
}

void AttractState::update(Particle* particle) {
    ofVec2f mousePosition(((ofApp*)ofGetAppPtr())->mouseX, ((ofApp*)ofGetAppPtr())->mouseY);
    ofVec2f direction = mousePosition - particle->position;
    direction.normalize();
    particle->velocity += direction * 0.05;
    ofClamp(particle->velocity.x, -3, 3);
    particle->position += particle->velocity * 0.2;
}

void RepelState::update(Particle* particle) {
    ofVec2f mousePosition(((ofApp*)ofGetAppPtr())->mouseX, ((ofApp*)ofGetAppPtr())->mouseY);
    ofVec2f direction = particle->position - mousePosition;
    direction.normalize();
    particle->velocity += direction * 0.05;
    ofClamp(particle->velocity.x, -3, 3);
    particle->position += particle->velocity * 0.2;
}

void StopState::update(Particle* particle) {
    particle->velocity.x = 0;
    particle->velocity.y = 0;
}

Particle* ParticleFactory::createParticle(const std::string& type) {
    Particle* particle = new Particle();

    if (type == "star") {
        particle->size = ofRandom(2, 4);
        particle->color = ofColor(255, 0, 0);
    }
    else if (type == "shooting_star") {
        particle->size = ofRandom(3, 6);
        particle->color = ofColor(0, 255, 0);
        particle->velocity *= 3;
    }
    else if (type == "planet") {
        particle->size = ofRandom(5, 8);
        particle->color = ofColor(0, 0, 255);
    }
    return particle;
}

void ofApp::setup() {
    ofBackground(0);
    // Crear partículas usando la fábrica
    for (int i = 0; i < 100; ++i) {
        Particle* p = ParticleFactory::createParticle("star");
        particles.push_back(p);
        addObserver(p);
    }

    for (int i = 0; i < 5; ++i) {
        Particle* p = ParticleFactory::createParticle("shooting_star");
        particles.push_back(p);
        addObserver(p);
    }

    for (int i = 0; i < 10; ++i) {
        Particle* p = ParticleFactory::createParticle("planet");
        particles.push_back(p);
        addObserver(p);
    }

}

void ofApp::update() {
    for (Particle* p : particles) {
        p->update();
    }
}

void ofApp::draw() {
    for (Particle* p : particles) {
        p->draw();
    }
}

void ofApp::keyPressed(int key) {
    if (key == 's') {
        notify("stop");
    }
    else if (key == 'a') {
        notify("attract");
    }
    else if (key == 'r') {
        notify("repel");
    }
    else if (key == 'n') {
        notify("normal");
    }
}
```

Ahora te pediré que te tomes un tiempo para analizar el código y entender su funcionamiento.

- ¿Qué hace el patrón observer en este caso?

Permite que ofApp (el Subject) notifique eventos a todas las partículas (Observer) registradas cuando se presiona una tecla.

Las partículas reaccionan cambiando su estado según el evento recibido ("attract", "repel", "stop", "normal").

- ¿Qué hace el patrón factory en este caso?

Centraliza la creación de partículas con diferentes propiedades (tamaño, color, velocidad) según su tipo ("star", "shooting_star", "planet").

- ¿Qué hace el patrón state en este caso?

Gestiona el comportamiento dinámico de las partículas (movimiento normal, atracción, repulsión, detención).

Cada estado (NormalState, AttractState, etc.) implementa su propia lógica en update().

Particle delega su actualización (particle->update()) al estado actual.

Experimenta con el código y realiza algunas modificaciones para entender mejor su funcionamiento.

### Modificación 1: Añadir un nuevo estado (SpinState)
Objetivo: Partículas que giren en círculos.

Añadir en ofApp.h:

```cpp
class SpinState : public State {
public:
    void update(Particle* particle) override {
        particle->position.x += cos(ofGetElapsedTimef()) * 2;
        particle->position.y += sin(ofGetElapsedTimef()) * 2;
    }
};
```

En Particle::onNotify, agregar:

```cpp
else if (event == "spin") {
    setState(new SpinState());
}
En ofApp::keyPressed, añadir:

cpp
else if (key == 'p') {  // Tecla 'p' para activar spin
    notify("spin");
}
```

### Modificación 2: Cambiar colores al cambiar estado
Objetivo: Partículas cambian de color según su estado.

Modificar onEnter en cada estado (ejemplo en AttractState):

```cpp
void onEnter(Particle* particle) override {
    particle->color = ofColor(255, 255, 0); // Amarillo al atraer
}
```

Repetir para otros estados (ej: RepelState → Rojo).

### Modificación 3: Añadir un nuevo tipo de partícula ("comet")
Objetivo: Partículas con cola (efecto visual).

En ParticleFactory::createParticle, añadir:

```cpp
else if (type == "comet") {
    particle->size = ofRandom(4, 7);
    particle->color = ofColor(255, 100, 0); // Naranja
    particle->velocity *= 4; // Más rápidas
}
```

En ofApp::setup, crear algunas:

```cpp
for (int i = 0; i < 3; ++i) {
    Particle* p = ParticleFactory::createParticle("comet");
    particles.push_back(p);
    addObserver(p);
}
```