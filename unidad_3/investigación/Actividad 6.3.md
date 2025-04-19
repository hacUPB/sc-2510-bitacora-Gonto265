# Actividad 6.3

El código anterior tiene un problema. ¿Puedes identificar cuál es? ¿Cómo lo solucionarías? Recuerda que deberías poder seleccionar una esfera y moverla con el mouse.

## Respuesta

El problema en el código está en la manera en que se selecciona una esfera y se mueve con el mouse. Actualmente, aunque selectedSphere apunta al objeto correcto, no se des-selecciona al liberar el botón del mouse. Esto significa que una vez seleccionada una esfera, continuará moviéndose con el cursor incluso si no se mantiene el clic presionado.

Para solucionar esto, necesitas implementar el método  para que  vuelva a apuntar a  cuando se libere el botón del mouse.

Agregando entonces en ofApp.h:

```cpp
void mouseReleased(int x, int y, int button);
```
Y en ofApp.cpp

```cpp
void ofApp::mouseReleased(int x, int y, int button) {
    if (button == OF_MOUSE_BUTTON_LEFT) {
        selectedSphere = nullptr; // Des-seleccionamos la esfera
    }
}
```