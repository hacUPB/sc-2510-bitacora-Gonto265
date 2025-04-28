# Bitácora de aprendizaje de la unidad 5: programación orientada a objetos

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
