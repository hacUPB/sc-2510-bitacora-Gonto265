# Bitácora de aprendizaje de la unidad 5: programación orientada a objetos

## Sesion 1

### introduccion a los objetos
```cpp
class Particle {
public:
    float x, y;
    void move(float dx, float dy) {
        x += dx;
        y += dy;
    }
};
```

- ¿Qué representa la clase Particle?

La clase Particle representa una partícula en un espacio bidimensional, en la cual sus atributos y métodos determinan su posición y su capacidad de movimiento.

Atributos (x y y): Los atributos x y y son variables de tipo float que almacenan las coordenadas de la partícula en el espacio 2D. representan la posición de la partícula en el plano y pueden actualizarse en el tiempo para simular movimiento.

Método move(float dx, float dy) : El método move permite modificar la posición de la partícula. Recibe dos parámetros, dx y dy, que representan el cambio en las coordenadas x y y, respectivamente. Al llamar move(dx, dy), la posición de la partícula se actualiza sumando dx a x y dy a y, lo cual simula un desplazamiento.

- ¿Cómo interactúan sus atributos y métodos?

estos interactuan usando los valores almacenados en x y y, la posicion actual de la particula; y al invocar move(dx, dy), los valores de x y y se modifican, simulando el movimiento de la partícula en el plano.

- Explícame en detalle qué es un objeto en C++ y cómo se relaciona con una clase. Usa el ejemplo de una clase Particle con atributos x y y y un método move.

un objeto es una instancia concreta de una clase, lo que significa que es una entidad específica creada a partir de una plantilla (la clase). La clase define los atributos y métodos que tendrá el objeto, y el objeto contiene esos datos y puede usar esos métodos. lo cual significa que cada objeto tiene su propia copia de los atributos definidos en la clase.

en un ejemplo seria la clase carro, la cual tiene los atributos y metodos que un carro normal tedria, el objeto ya seria aquel que tiene sus propios valores especificos que caben en esos atributos

### Explorando la memoria
Considera los siguientes pasos:

Crear instancias:
```cpp
Particle p1;
Particle p2;
```
Explorar la memoria usando punteros:
```cpp
std::cout << "Dirección de p1: " << &p1 << std::endl;
std::cout << "Dirección de p2: " << &p2 << std::endl;
```

Aquí estamos utilizando el operador & para obtener la dirección de memoria de los objetos p1 y p2. Cuando imprimimos estas direcciones, estamos viendo dónde se almacena cada objeto en la memoria.

Direcciones en hexadecimal: Las direcciones de memoria se imprimen típicamente en formato hexadecimal, mostrando el lugar específico en la RAM donde se encuentran p1 y p2.

Determinar el tamaño del objeto:
```cpp
std::cout << "Tamaño de Particle: " << sizeof(Particle) << " bytes" << std::endl;
```

Este código devuelve el tamaño en bytes de un objeto Particle. Dado que Particle tiene dos atributos float (x y y), el tamaño del objeto depende de cuántos bytes ocupa un float en el sistema.

Tamaño típico de float: En la mayoría de los sistemas, un float ocupa 4 bytes. Como Particle tiene dos float, se espera que el tamaño de Particle sea aproximadamente 8 bytes (4 bytes para x y 4 bytes para y).

sizeof(Particle) nos dice cuánto espacio ocupa un objeto Particle, en este caso, 8 bytes.

Imprimir direcciones de atributos:
```cpp
std::cout << "Dirección de p1.x: " << &(p1.x) << std::endl;
std::cout << "Dirección de p1.y: " << &(p1.y) << std::endl;
```
Aquí estamos viendo la ubicación exacta de los atributos x y y dentro de p1. Como x y y son atributos de p1, sus direcciones serán cercanas y estarán dentro del bloque de memoria asignado a p1.

Imprimir &p1.x y &p1.y nos permite ver cómo están alineados los atributos dentro del objeto.

Reflexión Guiada:

- ¿Los atributos están almacenados de forma contigua?

si estan almacenados de forma contigua quiere decir que uno esta cerca del otro. Esto significa que los datos de x e y en el objeto Particle se almacenan en ubicaciones de memoria consecutivas, una detrás de la otra.

el bloque de memoria contiene: La posición de x al inicio del objeto y La posición de y inmediatamente después de x, a 4 bytes de distancia, debido al tamaño del tipo float.

- ¿Qué indica el tamaño del objeto sobre su estructura interna?

El tamaño del objeto nos da información sobre los atributos internos y su disposición en la memoria: Dado que Particle tiene dos atributos float, el tamaño total de Particle es de 8 bytes, que es la suma de los tamaños de x y y.

el tamaño del objeto y la disposición contigua de los atributos permiten que el compilador optimice el acceso y manipulación de los datos en la memoria

- Prompt para ChatGPT: ¿Cómo se almacenan los objetos en memoria en C++? Si tengo dos instancias de Particle, ¿Cómo se relacionan sus direcciones de memoria? ¿Los atributos están contiguos?

cuando se almacena un objeto en la memoria este se almacena en una de dos ubicaciones princepales, heap o stack. si es en el stack los objetos se declaran dentro de una funcion, por ejemplo Particle p1; Este tipo de almacenamiento es temporal y la memoria se libera automáticamente cuando la función finaliza. mientras que el heap si utilizas new para crear un objeto (por ejemplo, Particle* p1 = new Particle();), el objeto se almacena en el heap. Este tipo de memoria persiste hasta que se libera explícitamente con delete. En este caso, las direcciones de memoria pueden estar más dispersas, dependiendo de cómo y cuándo se asigna la memoria.

en cuanto a como se relacionan las particulas, como ambas estan creadas en el heap. La dirección de p1 y p2 serán diferentes, pero generalmente estarán muy cercanas entre sí en la memoria. En este caso, p2 está solo 4 bytes después de p1 porque ambos tienen el mismo tamaño (8 bytes para Particle, ya que tiene dos float).

Dentro de un objeto, los atributos están almacenados de forma contigua. Esto indica que x y y están almacenados uno junto al otro en la memoria. Esto es una característica del diseño de clases en C++, donde los miembros de una clase se almacenan en el orden en que están definidos.

### Análisis de diferencias

- ¿Cómo afectan los datos estáticos al tamaño de la instancia?

Una variable estática se almacena en un lugar único de la memoria y es compartida por todas las instancias de la clase. Por lo tanto, el tamaño de la variable estática no se incluye en el tamaño de cada instancia.

No afecta el tamaño de la instancia: ya que no ocupan espacio en cada objeto. Solo los atributos no estáticos afectan el tamaño de la instancia.

- ¿Qué diferencias hay entre datos estáticos y dinámicos en términos de memoria?

Los estáticos solo ocupan memoria una vez en la clase, y ninguna en sus instancias; La memoria de una variable estática se reserva una sola vez, al iniciar el programa, y persiste hasta que el programa termina.

En cambio los dinámicos, ocupan memoria en cada una de sus instancias; La memoria en el heap persiste hasta que se libera manualmente con delete o free; Cada instancia de un objeto con datos dinámicos tiene su propio espacio en el heap (si ha realizado una asignación dinámica), por lo que puede ocupar cantidades de memoria variables en función del tamaño de los datos asignados.

- Prompt para ChatGPT: explícame cómo el uso de variables estáticas y dinámicas en una clase afecta el tamaño de sus instancias. ¿Las variables estáticas ocupan espacio en cada objeto?

- Espacio en memoria: Las variables estáticas no ocupan espacio en cada instancia del objeto. En lugar de almacenarse en cada objeto individual, se guardan en una ubicación única en memoria accesible para toda la clase. Dado que las variables estáticas no están almacenadas dentro de cada objeto, no afectan el tamaño de las instancias.

No ocupan espacio en cada objeto individual.

No afectan el tamaño de cada instancia

- Las variables dinámicas son aquellas cuya memoria se asigna manualmente en el heap usando un puntero y normalmente new. las dinámicas no tienen un espacio fijo reservado en la memoria del objeto; en cambio, el objeto solo contiene un puntero que apunta a la memoria asignada en el heap. Espacio en memoria: Cada instancia de la clase tiene su propio puntero, y este PUNTERO ocupa un espacio en la instancia. Sin embargo, el tamaño de la memoria asignada dinámicamente en el heap no afecta directamente el tamaño del objeto en sí.

Tamaño de la instancia: sizeof de una instancia con una variable dinámica incluirá el tamaño del puntero, pero no el tamaño de la memoria adicional asignada en el heap.

Solo el puntero ocupa espacio en el objeto.

La memoria adicional asignada dinámicamente en el heap no se refleja en el tamaño de la instancia (según sizeof), pero es importante tener en cuenta el espacio adicional que ocupan en el heap.

### Reflexión

- ¿Qué es un objeto desde la perspectiva de la memoria?
un objeto es una región de memoria, en la cual, se almacenan sus atributos.

Cada objeto en memoria tiene una dirección específica (una dirección inicial) que indica dónde comienza. es un bloque de datos contiguo que representa los miembros de datos de una clase

- ¿Cómo influyen los atributos y métodos en el tamaño y estructura del objeto?

dependiendo si los atributos son estaticos o dinamicos influyen de diferente forma en su tamaño y estructura; los estaticos ocupan menos espacio que los dinámicos, y dependiendo de si se encuentran en la clase, o una instancia, estos datos pueden estar o no contiguos en memoria. En cuanto a los métodos, estos no afectan al tamaño ni a la estructura de los objetos, ya que estos se almacenan en la sección de memoria que pertenece al código

- Conclusión: resumir los hallazgos y cómo esto impacta el diseño de clases.

Descubrí que, de ser necesario, el que los atributos sean estáticos puede ayudar a optimizar el tamaño de los objetos, debido a que solo hay una copia de estos. Los métodos no afectan al tamaño en memoria de un objeto, por lo que, si de memoria del objeto se trata, estos no son "importantes". Y finalmente el que dependiendo de en cual parte se creen los atributos, estos pueden o no estar contiguos en memoria.

la contiguidad de los atributos dependen de factores como el orden de declaración, tipo de datos y alineación. Si creamos varios objetos de la misma clase en la stack, estos se almacenarán en posiciones contiguas en la memoria de la stack, uno después del otro.

## Sesion 2: ubicación en memoria de datos y métodos

### Análisis de la estructura de una clase

- Datos: los atributos se almacenan en el stack o heap, según cómo se instancien.

- Métodos: el código de los métodos reside en la sección de código (texto) del programa.

- Vtables: estructuras usadas para implementar métodos virtuales.

- Prompt para ChatGPT: ¿Dónde se almacenan los datos y métodos de una clase en C++ en la memoria? Explica el concepto de vtable y cómo se relaciona con los métodos virtuales.

- Atributos(datos)

Atributos no estáticos: Estos atributos son específicos de cada instancia de la clase, por lo que se almacenan en el stack (si el objeto es local a una función) o en el heap (si el objeto se crea dinámicamente con new). Cada instancia de la clase tiene su propia copia de estos atributos, lo cual hace que el tamaño del objeto dependa directamente de los atributos no estáticos que contiene.

Atributos estáticos: Los atributos static de una clase no pertenecen a ninguna instancia específica, sino que son compartidos entre todas las instancias de la clase. Estos atributos se almacenan en una sección de memoria estática específica, que suele estar en el segmento de datos del programa (también llamado "data segment" o ".data"). Esto significa que solo hay una copia del atributo estático, y no importa cuántas instancias de la clase existan, todas acceden al mismo valor en la misma ubicación de memoria.

- Métodos (Funciones Miembro) Métodos no virtuales: Los métodos no virtuales no forman parte de las instancias de la clase. Estos métodos se almacenan en el segmento de código (o "text segment") de la memoria, que es una sección de solo lectura donde reside el código ejecutable del programa. No se crean múltiples copias de un método por cada instancia; en cambio, todas las instancias de la clase usan la misma copia de los métodos no virtuales.

Métodos virtuales: Los métodos virtuales requieren un mecanismo adicional para permitir el polimorfismo dinámico, que permite que las llamadas a métodos se resuelvan en tiempo de ejecución, dependiendo del tipo real del objeto. Para implementar este comportamiento, el compilador usa un concepto llamado tabla de métodos virtuales o vtable.

- ¿Qué es la vtable?

La vtable (tabla de métodos virtuales) es una estructura de datos generada por el compilador para cada clase que contiene métodos virtuales. Es básicamente un arreglo de punteros que apunta a las versiones adecuadas de los métodos virtuales de la clase. La vtable permite que el programa determine en tiempo de ejecución cuál versión de un método debe llamar, dependiendo del tipo dinámico del objeto.

Estructura de la vtable: Cada clase con al menos un método virtual tiene su propia vtable. La vtable contiene punteros a las funciones que implementan los métodos virtuales de esa clase.

Polimorfismo dinámico: Cuando se llama a un método virtual a través de un puntero o una referencia a la clase base, la vtable se usa para "mirar" la dirección de la versión correcta del método y ejecutarla, permitiendo que una llamada de función apunte a distintas implementaciones en tiempo de ejecución.

- ¿Qué es el vptr?

Cada instancia de una clase con métodos virtuales contiene un puntero especial llamado vptr (puntero a la vtable) que apunta a la vtable de la clase. Este puntero ocupa espacio en cada instancia de la clase y se inicializa automáticamente cuando se crea el objeto. El vptr es lo que conecta la instancia específica con su vtable correspondiente.

- Resumen

Atributos no estáticos se almacenan en la stack o en el heap, según cómo se creen las instancias.

Atributos estáticos se almacenan en el segmento de datos y se comparten entre todas las instancias.

Métodos no virtuales se almacenan en el segmento de código, y solo hay una copia para todas las instancias.

Métodos virtuales usan una vtable para soportar el polimorfismo dinámico. Cada clase con métodos virtuales tiene una vtable, y cada instancia de una clase con métodos virtuales tiene un vptr que apunta a la vtable correspondiente.

### Exploración de métodos virtuales

Considera los siguientes pasos:

Crea una jerarquía de clases con métodos virtuales:
```cpp
class Base {
public:
    virtual void display() {
        std::cout << "Base display" << std::endl;
    }
};

class Derived : public Base {
public:
    void display() override {
        std::cout << "Derived display" << std::endl;
    }
};
```

Analiza la vtables. ¿En qué parte de la memoria se encuentran las vtable de cada objeto?

```cpp
Base b;
Derived d;
std::cout << "Vtable de Base: " << *(void**)&b << std::endl;
std::cout << "Vtable de Derived: " << *(void**)&d << std::endl;
```

Usar un depurador: observar cómo se resuelven las llamadas a métodos virtuales en tiempo de ejecución. Puedes usar para ello varias herramientas del depurador. En el menú Debug de Visual Studio, selecciona Windows y luego Memory. Allí podrás explorar la memoria. Si das click derecho sobre una función del código puedes ver el programa en ensamblador con Go to Dissasembly.

- ¿Cómo afecta la presencia de métodos virtuales al tamaño del objeto?

Afecta el tamaño de cada instancia de esa clase, porque cada objeto necesita un puntero adicional para acceder a la vtable. Este puntero se llama vptr (puntero a la vtable) y ocupa un espacio en la memoria de cada instancia de la clase.

Debido a este puntero, el tamaño de cada objeto de esa clase aumenta para acomodar el vptr.

Sin importar cuántos métodos virtuales tenga una clase, solo se necesita un vptr por objeto. Por lo tanto, agregar más métodos virtuales no aumenta el tamaño del objeto más allá del espacio necesario para un solo punter

- ¿Qué papel juegan las vtables en el polimorfismo?

el polimorfismo dinámico permite que un mismo código funcione con diferentes tipos derivados de una clase base, eligiendo la implementación correcta de un método virtual en función del tipo del objeto en tiempo de ejecución.

Por ejemplo, si tienes una clase base Animal y una clase derivada Dog, el polimorfismo dinámico permite que un puntero Animal* que apunta a un objeto Dog pueda llamar al método Dog::makeSound() (en lugar de Animal::makeSound()).

Las vtables hacen que esta decisión se pueda tomar en tiempo de ejecución, permitiendo que un mismo puntero de clase base pueda llamar al método correcto de una clase derivada. el programa utiliza la vtable para decidir qué versión del método debe ejecutar.

hacer uso de punteros y referencias de clase base para manejar objetos de clases derivadas

- Prompt para ChatGPT: ¿Cómo se implementan los métodos virtuales en C++? Explica el concepto de vtable y cómo se utiliza para resolver llamadas a métodos virtuales.

Los métodos virtuales en C++ se implementan de tal manera que permiten el polimorfismo dinámico. Este mecanismo permite que una llamada a un método virtual se resuelva en tiempo de ejecución, de acuerdo con el tipo real del objeto al que un puntero o referencia está apuntando, incluso si el tipo declarado es de la clase base.

- El Concepto de vtable

La vtable (tabla de métodos virtuales) es una estructura de datos generada por el compilador para cada clase que tenga métodos virtuales. La vtable contiene punteros a los métodos virtuales de la clase. Es importante destacar que cada clase con métodos virtuales tiene su propia vtable, y las clases derivadas tienen su propia vtable, que puede sobrescribir o agregar métodos.

¿Cómo funciona la vtable?

Cuando un objeto de una clase con métodos virtuales es creado, el compilador asigna un puntero (vptr) dentro del objeto que apunta a la vtable de la clase del objeto. Este puntero se usa para resolver dinámicamente las llamadas a los métodos virtuales.

Al invocar un método virtual en un objeto, el programa utiliza el vptr para consultar la vtable y encontrar el puntero al método adecuado que debe ejecutarse.

Cuando un método virtual es invocado, el compilador usa el vptr para acceder a la vtable del objeto real (no al tipo declarado), lo que permite la llamada al método correcto en tiempo de ejecución.

### Uso de punteros y referencias

Considera estos pasos:

Implementar una clase con punteros a funciones:
```cpp
class FunctionPointerExample {
public:
    void (*funcPtr)();
    static void staticFunction() {
        std::cout << "Static function called" << std::endl;
    }
    void assignFunction() {
        funcPtr = staticFunction;
    }
};
```

#### Analizar el impacto en memoria:

- Observar si el tamaño de la instancia cambia al usar punteros a funciones.

La inclusión de un puntero a función en una clase aumenta el tamaño de la instancia en memoria. el tamaño de FunctionPointerExample es de 8 bytes

- Verificar cómo se almacenan estos punteros.

Estos punteros se almacenan como la dirección de la función que está almacenada en la instancia.

#### Reflexión Guiada:
- ¿Cuál es la relación entre los punteros a métodos y la vtable?

La vtable permite resolución dinámica de las llamadas a métodos, lo que significa que, el compilador resuelve la llamada en tiempo de ejecución, dependiendo del tipo real del objeto al que apunta un puntero o referencia.

los punteros a métodos requieren que el objeto sobre el cual se llama el método esté presente (porque los métodos pueden acceder al estado interno del objeto). Esto los convierte en punteros que no solo contienen una dirección de memoria, sino también información relacionada con el objeto en el cual se invocan.

Punteros a métodos virtuales permiten realizar llamadas dinámicas a métodos, y estos punteros están directamente relacionados con la vtable, que maneja la resolución dinámica de las llamadas a métodos.

estos son dos formas distintas para hacer lo mismo. Ambas cosas, son en cierta forma un polimorfismo, ya que son maneras de llamar a una función, por "nombres" distintos.

- ¿Cómo afectan estos mecanismos al rendimiento del programa?

Los punteros a funciones son más eficientes debido a que no implican sobrecarga adicional, no tienen más complejidad, y los punteros a métodos miembro son menos eficientes, debido a que tienen la necesidad de pasar por el puntero "this", lo que implica más de sobrecarga en la llamada, porque necesita acceso al contexto.

Cuando llamas a una función directamente, la llamada es muy eficiente porque el compilador ya sabe la dirección de la función en tiempo de compilación.

En cambio, cuando usas un puntero a función, el compilador no puede conocer la dirección de la función hasta que el puntero sea asignado en tiempo de ejecución. Esto introduce una ligera sobrecarga porque el compilador tiene que buscar la dirección de la función en el puntero antes de realizar la llamada.

Cuando usas punteros a métodos virtuales, el compilador tiene que resolver en tiempo de ejecución cuál es la implementación correcta del método (esto se hace a través de la vtable). Esto significa que las llamadas a métodos virtuales tienen una sobrecarga adicional debido a la resolución dinámica.

la ejecucion de algo en el tiempo de compilacion es mejor para el rendimiento que la ejecucion en el tiempo de ejecucion

- Prompt para ChatGPT: ¿Qué diferencia hay entre punteros a funciones y punteros a métodos miembro en C++? ¿Cómo afectan al tamaño de los objetos y al rendimiento?

Un puntero a función es una variable que almacena la dirección de una función que no está asociada a ningún objeto. Un puntero a método miembro es un puntero que almacena la dirección de un método miembro de una clase. A diferencia de los punteros a funciones, los punteros a métodos están asociados a una instancia de clase.

Efectos sobre el tamaño de los objetos

- Punteros a funciones: Un puntero a función no afecta el tamaño de los objetos a los que apunta, porque es una variable separada y no está asociada a ninguna clase en particular. su tamaño depende del tipo de puntero y la arquitectura del sistema

- punteros a métodos miembro: pueden afectar el tamaño de la clase porque los punteros a métodos no se almacenan como punteros comunes. los métodos son virtuales, se usan vtable (tablas de métodos virtuales), y la sobrecarga de acceder a la vtable puede afectar la memoria y la resolución dinámica de los métodos. la vtable agrega un puntero a la vtable en cada objeto de clase, lo que aumenta el tamaño de la instancia del objeto.

rendimiento

funciones- Ligera sobrecarga debido a la llamada indirecta.

metodos- Más sobrecarga en el caso de métodos virtuales (debido a la vtable).

#### Reflexión individual:
- ¿Dónde residen los datos y métodos de una clase en la memoria?

Los metodos residen en la sección de código, y los datos residen en la memoria global, ya que estos existen durante toda la ejecución del programa.

Cuando se crea un objeto de una clase, sus datos miembro (atributos) se almacenan en el stack si el objeto es local o en el heap si el objeto es creado dinámicamente (usando new). Si los atributos de la clase son estáticos (es decir, compartidos por todas las instancias de la clase), se almacenan en el segmento de datos estáticos, no en la instancia del objeto.

Los métodos no estáticos y estáticos se almacenan en el segmento de código (text segment) donde residen las instrucciones del programa, lo que permite que todos los objetos de la clase compartan las mismas funciones sin necesidad de duplicarlas. Los métodos virtuales y el polimorfismo están relacionados con la vtable, que reside en una ubicación separada de la memoria.

- ¿Cómo interactúan las diferentes partes en tiempo de ejecución?

Estos interactuan según sus funciones, cuando se crea el objeto, se reserva el espacio en la memoria, por los metodos virtuales se establecen los punteros a las vtables. Y los métodos no virtuales se resuelven en tiempo de compilación, y los virtuales en tiempo de ejecución.

- Conclusión: cómo esta comprensión afecta el diseño de sistemas.

Comprender todo esto nos ayuda a poder realizar y entender los polimorfismo, y a saber cómo estos afectan a la memoria y al rendimiento del programa, de esta forma administrar este rendimeinto y permitir un mejor desarrollo.

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