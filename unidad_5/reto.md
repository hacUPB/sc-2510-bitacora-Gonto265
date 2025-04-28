# Reto
Ahora es momento de aplicar todo lo que has aprendido. En estas sesiones, crearás tu propio proyecto de arte generativo en openFrameworks, utilizando la programación orientada a objetos de manera consciente y fundamentada. Cada decisión que tomes estará basada en una comprensión profunda de cómo funcionan los objetos, datos y métodos en la memoria. Además, documentarás este proceso en tu bitácora, reflejando tus descubrimientos y aprendizajes. ¡Es tu oportunidad para transformar el conocimiento en creatividad!

Objetivo: implementar un proyecto de arte generativo, documentando en detalle cómo se aplican e impactan las abstracciones de OOP en el proyecto.

para ofApp.h

```cpp
#pragma once

#include "ofMain.h"
#include <vector>
#include <memory>

// Clase base Particle
class Particle {
protected:
    ofVec2f position;
    ofVec2f velocity;
    float size;
    ofColor color;

public:
    Particle(ofVec2f pos, ofVec2f vel, float sz, ofColor col)
        : position(pos), velocity(vel), size(sz), color(col) {}

    virtual ~Particle() {}

    virtual void update() {
        position += velocity;
    }

    virtual void draw() {
        ofSetColor(color);
        ofDrawCircle(position, size);
    }
};

// Clase derivada ParticleTypeA
class ParticleTypeA : public Particle {
public:
    ParticleTypeA(ofVec2f pos, ofVec2f vel, float sz, ofColor col)
        : Particle(pos, vel, sz, col) {}

    void update() override {
        velocity.rotate(1);  // Rota la velocidad ligeramente en cada actualización
        Particle::update();
    }
};

// Clase derivada ParticleTypeB
class ParticleTypeB : public Particle {
public:
    ParticleTypeB(ofVec2f pos, ofVec2f vel, float sz, ofColor col)
        : Particle(pos, vel, sz, col) {}

    void update() override {
        velocity *= 0.99;  // Desacelera la velocidad ligeramente en cada actualización
        Particle::update();
    }
};

// Sistema de Partículas
class ParticleSystem {
private:
    std::vector<std::shared_ptr<Particle>> particles;

public:
    void addParticle(std::shared_ptr<Particle> particle) {
        particles.push_back(particle);
    }

    void update() {
        for (auto& particle : particles) {
            particle->update();
        }
    }

    void draw() {
        for (auto& particle : particles) {
            particle->draw();
        }
    }
};

// Clase principal de openFrameworks
class ofApp : public ofBaseApp {
public:
    void setup();
    void update();
    void draw();

private:
    ParticleSystem particleSystem;
};
```

ofApp.cpp

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0); // Fondo negro
}

//--------------------------------------------------------------
void ofApp::update(){
    particleSystem.update();

    // Añade partículas aleatorias con diferentes tipos
    if (ofRandom(1) > 0.5) {
        particleSystem.addParticle(std::make_shared<ParticleTypeA>(
            ofVec2f(ofGetWidth() / 2, ofGetHeight() / 2),
            ofVec2f(ofRandom(-2, 2), ofRandom(-2, 2)),
            5,
            ofColor::blue
        ));
    } else {
        particleSystem.addParticle(std::make_shared<ParticleTypeB>(
            ofVec2f(ofGetWidth() / 2, ofGetHeight() / 2),
            ofVec2f(ofRandom(-2, 2), ofRandom(-2, 2)),
            5,
            ofColor::red
        ));
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    particleSystem.draw();
}
```

en el codigo existen tres clases principales

Particle: Clase base que contendrá propiedades básicas como posición, velocidad y métodos comunes.

ParticleTypeA y ParticleTypeB: Subclases que extenderán la funcionalidad de Particle con diferentes comportamientos.

ParticleSystem: Gestionará un conjunto de partículas, permitiendo añadir, eliminar y actualizar todas las partículas en la escena.

#### herencia

las particulas tipo a y b son subclases de la particula que es una clase base. esta base tiene propiedades y métodos comunes para todas las partículas, como position, velocity, update(), y draw().

las subclases heredan a particle. heredan sus atributos y metodos públicos y protegidos de Particle. Ambas clases heredan los métodos update() y draw() de Particle, pero también pueden redefinir update() para implementar su comportamiento único.

#### encapsulamiento

Las propiedades position, velocity, size, y color están protegidas en Particle, lo cual significa que son accesibles en Particle y sus subclases, pero están ocultas del resto del programa.

#### polimorfismo

El polimorfismo se activa en C++ cuando utilizamos métodos virtuales en la clase base (Particle). Los métodos update() y draw() de Particle están declarados como virtuales:

Esto significa que cuando llamas a update() o draw() en un puntero a Particle, el programa no invocará el método de la clase base (Particle), sino el método específico de la subclase (ya sea ParticleTypeA o ParticleTypeB), dependiendo del tipo real de objeto al que apunte el puntero.

En tu clase ParticleSystem, las partículas se almacenan en un vector de punteros a Particle (usando std::shared_ptr para administración automática de memoria). Esto significa que puedes almacenar cualquier tipo de partícula, ya sea una Particle, ParticleTypeA, o ParticleTypeB en el mismo contenedor.

Polimorfismo permite que el mismo puntero a Particle llame a diferentes versiones de update() y draw(), dependiendo del tipo real de la partícula (ParticleTypeA, ParticleTypeB, etc.).