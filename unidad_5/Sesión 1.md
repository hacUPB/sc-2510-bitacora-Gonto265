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