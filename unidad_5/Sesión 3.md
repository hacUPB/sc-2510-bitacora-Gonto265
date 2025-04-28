# Bitácora de aprendizaje de la unidad 5: programación orientada a objetos

## Sesion 3: implementación Interna de Encapsulamiento, Herencia y Polimorfism
### Profundizando en el encapsulamiento
encapsulamiento se refiere a la ocultación de los detalles internos de una clase, permitiendo que sus atributos y métodos estén protegidos del acceso directo desde fuera de la clase. En otras palabras, el encapsulamiento es una forma de organizar y restringir el acceso a los datos, brindando un control más seguro y organizado sobre el comportamiento de un objeto.

Crear una clase con diferentes niveles de acceso:

```cpp
class AccessControl {
private:
    int privateVar;
protected:
    int protectedVar;
public:
    int publicVar;
    AccessControl() : privateVar(1), protectedVar(2), publicVar(3) {}
};
```

Intentar acceder a los miembros desde una función externa:

```cpp
int main() {
    AccessControl ac;
    ac.publicVar = 10; // Válido
    // ac.protectedVar = 20; // Error de compilación
    // ac.privateVar = 30; // Error de compilación
    return 0;
}
```

Miembro privado: solo accesible dentro de la clase

Miembro protegido: accesible dentro de la clase y en clases derivadas

Miembro público: accesible desde cualquier parte del programa

```cpp
AccessControl() : privateVar(1), protectedVar(2), publicVar(3) {}
```

Este es el constructor de la clase AccessControl, que se utiliza para inicializar los tres miembros de datos con valores específicos:

privateVar se inicializa con 1.

protectedVar se inicializa con 2.

publicVar se inicializa con 3.

Prompt para ChatGPT: ¿Cómo implementa el compilador el encapsulamiento en C++? Si los miembros privados aún ocupan espacio en el objeto, ¿Qué impide que se acceda a ellos desde fuera de la clase?

- ontrol de acceso a nivel del compilador:

El compilador no cambia la estructura de memoria del objeto; los miembros privados y protegidos aún ocupan espacio en el objeto, igual que los miembros públicos. Sin embargo, lo que el compilador hace es generar un control de acceso para asegurar que las reglas de acceso se cumplan durante la compilación y ejecución del programa.

Esto significa que el compilador comprueba que las llamadas a los miembros privados desde fuera de la clase o desde funciones no autorizadas generen errores de compilación. Si intentas acceder a un miembro privado fuera de la clase (sin métodos públicos), el compilador emite un error.

- Cómo se implementa esto internamente:

El compilador utiliza información de visibilidad de los miembros (es decir, si un miembro es público, privado o protegido) y no genera código para permitir el acceso directo a los miembros privados fuera de la clase.

La verificación del acceso a través de los modificadores de acceso (como private o public) se realiza en tiempo de compilación. Cuando se intenta acceder a un miembro privado desde fuera de la clase, el compilador lo detecta y muestra un error, ya que el acceso no está permitido.

Aunque los miembros privados ocupan espacio en la memoria como cualquier otro miembro, el compilador impide el acceso directo a esos miembros desde fuera de la clase a través de restricciones de acceso en tiempo de compilación.

### Hagamos un poco de hackers y rompamos el encapsulamiento
Definición de la clase: primero, define una clase con miembros privados para observar el acceso a esos miembros desde fuera de la clase.
```cpp
#include <iostream>

class MyClass {
private:
    int secret1;
    float secret2;
    char secret3;

public:
    MyClass(int s1, float s2, char s3) : secret1(s1), secret2(s2), secret3(s3) {}

    void printMembers() const {
        std::cout << "secret1: " << secret1 << "\n";
        std::cout << "secret2: " << secret2 << "\n";
        std::cout << "secret3: " << secret3 << "\n";
    }
};
```

Intento de acceso ilegal: verifica que no se puede acceder a los miembros privados directamente utilizando el compilador:

```cpp
int main() {
    MyClass obj(42, 3.14f, 'A');
    // Esta línea causará un error de compilación
    std::cout << obj.secret1 << std::endl;

    obj.printMembers();  // Método público para mostrar los valores
    return 0;
}
```

El código anterior intentará acceder directamente al miembro privado secret1, lo que resultará en un error de compilación.

Acceso a miembros privados usando reinterpret_cast: ahora, observa cómo violar el encapsulamiento utilizando reinterpret_cast y la aritmética de punteros:

```cpp
int main() {
    MyClass obj(42, 3.14f, 'A');

    // Usando reinterpret_cast para violar el encapsulamiento
    int* ptrInt = reinterpret_cast<int*>(&obj);
    float* ptrFloat = reinterpret_cast<float*>(ptrInt + 1);
    char* ptrChar = reinterpret_cast<char*>(ptrFloat + 1);

    // Accediendo y mostrando los valores privados
    std::cout << "Accediendo directamente a los miembros privados:\n";
    std::cout << "secret1: " << *ptrInt << "\n";       // Accede a secret1
    std::cout << "secret2: " << *ptrFloat << "\n";     // Accede a secret2
    std::cout << "secret3: " << *ptrChar << "\n";      // Accede a secret3

    return 0;
}
```

#### Ahora reflexiona:
- ¿Qué es el encapsulamiento y cuál es su propósito en la programación orientada a objetos?

el encapsulamiento es un metodo de proteccion para los atributos y metodos, ocultando detalles internos y controlando su acceso. esto con el objetivo de proteger los datos, facilitar el mantenimiento y extensibilidad, y logar tener una interfaz controlada

- ¿Por qué es importante proteger los datos de una clase y restringir el acceso desde fuera de la misma?

evita cambio no desados sobre el objeto y posibles errores en este, manteniendo el mantenimiento, integridad y seguridad del programa.

- ¿Qué significa reinterpret_cast y cómo afecta la seguridad del programa?

esta funcion permite reinterpretar el tipo de un puntero o una referencia sin realizar ninguna verificación. A diferencia de otros casts, reinterpret_cast permite al programador ignorar las reglas de tipo de datos de C++, tratando un bloque de memoria como si fuera de otro tipo. rompiendo de esta forma las reglas del encapsulamiento comprometiendo la seguridad y confiabilidad del programa,

- ¿Por qué crees que se pudo acceder a los miembros privados de MyClass en este experimento, a pesar de que el compilador normalmente lo impediría?

Aunque el encapsulamiento controla el acceso desde una perspectiva de tiempo de compilación, no se impone una restricción absoluta a nivel de memoria, especialmente con punteros que permiten manipular y reinterpretar datos directamente. presenta una vulnerabilidad

- ¿Cuáles podrían ser las consecuencias de utilizar técnicas como las mostradas en este experimento en un programa real?

Inestabilidad del programa: Modificar datos internos de un objeto puede generar un estado inconsistente en el programa, causando fallas difíciles de depurar. tambien puede crear errores o incluso fallas en el programa, por un comportamiento indefinido, volviendose un codigo dificil de mantener.

- ¿Qué implicaciones tiene este experimento sobre la confianza en las barreras de encapsulamiento que proporciona C++?

esto implica que las barreras proporcionadas por el encapsulamiento no son absolutas, y pueden ser facilmente ignoradas por mecanismos de acceso de bajo nivel.

### Herencia y la Relación en Memoria
Considera los siguientes pasos:

Crear clases con herencia:
```cpp
class Base {
public:
    int baseVar;
};
class Derived : public Base {
public:
    int derivedVar;
};
```

Analizar las direcciones de memoria:
```cpp
Derived d;
std::cout << "Dirección de d: " << &d << std::endl;
std::cout << "Dirección de d.baseVar: " << &(d.baseVar) << std::endl;
std::cout << "Dirección de d.derivedVar: " << &(d.derivedVar) << std::endl;
```

- ¿Cómo se organizan los atributos en memoria?

cuando se usa una herencia, estos atributos estan organizados de forma contigua, los atributos de una clase derivada (subclase) svan de segundo y los de la clase base (superclase) se organizan de primero.

almacenar primero los miembros de Base, y luego los de Derived. Esto permite que la instancia de Derived tenga tanto los atributos de Base como los suyos propios en una sola región de memoria.

- ¿Qué sucede si agregamos más niveles de herencia?

En múltiples niveles de herencia, los atributos de cada nivel se almacenan de forma ordenada y contigua, asegurando que el objeto derivado final contenga en memoria tanto los miembros de la clase base como los suyos propios en una sola área contigua.

Prompt para ChatGPT: explícame cómo se organiza en memoria un objeto de una clase derivada en C++. ¿Cómo se almacenan los atributos de la clase base y de la derivada?

Organización de Memoria en Objetos Derivados

Cuando una clase derivada hereda de una clase base, el compilador organiza la memoria de modo que: Primero se asigna espacio en memoria para los atributos de la clase base. Luego, se asigna espacio para los atributos de la clase derivada.

La razón de esta organización es que cada objeto derivado es también un objeto de su clase base, lo que permite que los atributos de la clase base estén disponibles para la clase derivada.

La memoria de un objeto derivado es contigua y contiene los miembros de todas las clases en la jerarquía de herencia.

En caso de herencia múltiple, este orden se respeta para cada clase en la jerarquía, de forma que los atributos de cada clase base se colocan antes que los de la derivada en la memoria del objeto final.

### Polimorfismo y Vtables en detalle
Considera los siguientes pasos:

Crear una jerarquía polimórfica:

```cpp
class Animal {
public:
    virtual void makeSound() {
        std::cout << "Some generic sound" << std::endl;
    }
};
class Dog : public Animal {
public:
    void makeSound() override {
        std::cout << "Bark" << std::endl;
    }
};
class Cat : public Animal {
public:
    void makeSound() override {
        std::cout << "Meow" << std::endl;
    }
};
```

Usar punteros de la clase base:

```cpp
Animal* animals[] = { new Dog(), new Cat() };
for (Animal* animal : animals) {
    animal->makeSound();
}
```

Analizar con un depurador: observa cómo se resuelven las llamadas a makeSound() en tiempo de ejecución.

- ¿Cómo utiliza el programa las vtables para el polimorfismo?

Mediante el vptr y la vtable, C++ permite seleccionar el método correcto en tiempo de ejecución según el tipo real del objeto, logrando así el comportamiento polimórfico.

al llamarse un metodo virtual, el programa accede al puntero del objeto que invoca el metodo.

- ¿Cuál es el impacto en el rendimiento?

Introduce un leve costo en rendimiento debido a la indirección (el programa debe buscar el método en la vtable). Las vtables y los vptrs aumentan el consumo de memoria.

Llamadas a métodos virtuales: Más lentas que las llamadas directas debido a la resolución en tiempo de ejecución.

- Prompt para ChatGPT: ¿Cómo funciona el polimorfismo en C++ a nivel interno? Explica cómo se utilizan las vtables para resolver métodos virtuales en una jerarquía de herencia.

+La Vtable (Tabla Virtual)

Para cada clase que tenga métodos virtuales, el compilador crea una vtable. La vtable es una tabla de punteros que apunta a las funciones (métodos) virtuales de la clase. Esta tabla contiene una entrada para cada método virtual en la clase, apuntando a la implementación correcta según la clase.

Si la clase Base tiene un método virtual llamado display(), su vtable tendrá un puntero a Base::display.

Si una clase Derived hereda de Base y redefine display(), la vtable de Derived apuntará a Derived::display en lugar de Base::display.

#### Reflexión Individual:
- ¿Cómo se implementan internamente el encapsulamiento, la herencia y el polimorfismo?

El encapsulamiento funciona como un tipo de protección, la cual impide o permite el acceso a datos según se indique. La herencia funciona con la clase Derivada como una "copia" de la clase Base, debido a los datos que comparten. Y el polimorfismo como una tabla de punteros, que indican a cual metodo llamar según el objeto, a demas representan comportamientos iguales que se ejecutan de forma difrente, asi que este se encarga de apuntar a la forma en que lo debe ejecutar reutilizando el metodo.

- Análisis: ventajas y desventajas en términos de eficiencia y complejidad.

En terminos de eficiencia pueden llegar a ser peores, si de rendimiento se trata, pero fácilitan mucho el entendimiento y comprensión de un código, además del orden.