// Importa las librerías necesarias de Flutter, en este caso, el paquete `material` para los widgets.
import 'package:flutter/material.dart';

// Importa un archivo local que contiene el servicio de WebSocket.
import '../utils/websocket_service.dart';

// Define un widget sin estado (StatelessWidget) llamado `RobotButtons`.
class RobotButtons extends StatelessWidget {
  // Declara una variable final que almacena el servicio de WebSocket.
  final WebSocketService webSocketService;

  // Constructor de la clase, que recibe una instancia de `WebSocketService` como argumento requerido.
  const RobotButtons({super.key, required this.webSocketService});

  // Función para mover el robot hacia adelante.
  void _moveForward() {
    // Envía un mensaje al WebSocket indicando un movimiento lineal hacia adelante.
    webSocketService.sendMessage({
      "op": "publish", // Operación para publicar un mensaje.
      "topic": "/cmd_vel", // Tópico del robot para controlar la velocidad.
      "msg": {
        "linear": {"x": 1.00, "y": 0.00, "z": 0.0}, // Movimiento lineal hacia adelante en el eje X.
        "angular": {"x": 0.0, "y": 0.0, "z": 0.0} // Sin rotación angular.
      }
    });
  }

  // Función para mover el robot hacia atrás.
  void _moveBackward() {
    // Envía un mensaje al WebSocket indicando un movimiento lineal hacia atrás.
    webSocketService.sendMessage({
      "op": "publish",
      "topic": "/cmd_vel",
      "msg": {
        "linear": {"x": -1.00, "y": 0.00, "z": 0.0}, // Movimiento lineal hacia atrás en el eje X.
        "angular": {"x": 0.0, "y": 0.0, "z": 0.0} // Sin rotación angular.
      }
    });
  }

  // Función para girar el robot a la izquierda.
  void _turnLeft() {
    // Envía un mensaje al WebSocket indicando un giro angular hacia la izquierda.
    webSocketService.sendMessage({
      "op": "publish",
      "topic": "/cmd_vel",
      "msg": {
        "linear": {"x": 0.00, "y": 0.00, "z": 0.0}, // Sin movimiento lineal.
        "angular": {"x": 0.0, "y": 0.0, "z": 0.5} // Rotación angular positiva en el eje Z.
      }
    });
  }

  // Función para girar el robot a la derecha.
  void _turnRight() {
    // Envía un mensaje al WebSocket indicando un giro angular hacia la derecha.
    webSocketService.sendMessage({
      "op": "publish",
      "topic": "/cmd_vel",
      "msg": {
        "linear": {"x": 0.00, "y": 0.00, "z": 0.0}, // Sin movimiento lineal.
        "angular": {"x": 0.0, "y": 0.0, "z": -0.5} // Rotación angular negativa en el eje Z.
      }
    });
  }

  // Función para detener el robot.
  void _stop() {
    // Envía un mensaje al WebSocket indicando que se detengan todos los movimientos.
    webSocketService.sendMessage({
      "op": "publish",
      "topic": "/cmd_vel",
      "msg": {
        "linear": {"x": 0.00, "y": 0.00, "z": 0.0}, // Sin movimiento lineal.
        "angular": {"x": 0.0, "y": 0.0, "z": 0.0} // Sin movimiento angular.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Construye la interfaz gráfica del widget.
    return Column(
      // Alinea los widgets hijos en el centro del eje principal (vertical).
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Botón para mover hacia adelante.
        ElevatedButton(
          onPressed: _moveForward, // Asigna la función `_moveForward` al evento onPressed.
          child: const Text('Forward'), // Texto del botón.
        ),
        const SizedBox(height: 12), // Espaciador con altura de 12 píxeles.
        // Fila que contiene los botones Izquierda, Stop y Derecha.
        Row(
          // Alinea los widgets hijos en el centro del eje principal (horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botón para girar a la izquierda.
            ElevatedButton(
              onPressed: _turnLeft, // Asigna la función `_turnLeft` al evento onPressed.
              child: const Text('Left'), // Texto del botón.
            ),
            const SizedBox(width: 12), // Espaciador con ancho de 12 píxeles.
            // Botón para detener el robot.
            ElevatedButton(
              onPressed: _stop, // Asigna la función `_stop` al evento onPressed.
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Cambia el color del botón a rojo.
              ),
              child: const Text('STOP'), // Texto del botón.
            ),
            const SizedBox(width: 12), // Espaciador con ancho de 12 píxeles.
            // Botón para girar a la derecha.
            ElevatedButton(
              onPressed: _turnRight, // Asigna la función `_turnRight` al evento onPressed.
              child: const Text('Right'), // Texto del botón.
            ),
          ],
        ),
        const SizedBox(height: 12), // Espaciador con altura de 12 píxeles.
        // Botón para mover hacia atrás.
        ElevatedButton(
          onPressed: _moveBackward, // Asigna la función `_moveBackward` al evento onPressed.
          child: const Text('Back'), // Texto del botón.
        ),
      ],
    );
  }
}
