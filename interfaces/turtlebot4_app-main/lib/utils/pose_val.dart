import 'dart:convert'; 
// Importa la biblioteca para codificar y decodificar JSON.

import '../utils/websocket_service.dart'; 
// Importa un archivo o clase externa que gestiona la conexión WebSocket.

class PoseAndVelocityManager { 
  // Define una clase para gestionar la posición, orientación y velocidad en un entorno de simulación.

  // Variables para almacenar la posición y orientación de la simulación como cadenas.
  String truthPosePosition = ''; 
  String truthPoseOrientation = ''; 

  // Variables para almacenar la velocidad lineal y angular como valores de punto flotante.
  double linearVelocityX = 0.0; 
  double linearVelocityY = 0.0; 
  double linearVelocityZ = 0.0; 
  double angularVelocityX = 0.0; 
  double angularVelocityY = 0.0; 
  double angularVelocityZ = 0.0; 

  // Método para suscribirse a temas de ROS y actualizar las variables.
  void subscribeToTopics(WebSocketService webSocketService, 
      Function updatePosition, Function updateVelocity) {
    // Suscripción a un tema en ROS a través del WebSocket.
    webSocketService.sendMessage({"op": "subscribe", "topic": "/odom"}); 
    // Envía un mensaje para suscribirse al tema "/odom", que contiene datos de odometría.

    // Escucha los mensajes recibidos desde el WebSocket.
    webSocketService.channel.stream.listen((message) { 
      // Decodifica el mensaje JSON recibido.
      var decodedMessage = jsonDecode(message); 

      // Verifica si el mensaje corresponde al tema "/odom".
      if (decodedMessage['topic'] == '/odom') { 
        // Extrae la posición y orientación del mensaje.
        var poseMsg = decodedMessage['msg']['pose']['pose']; 
        updatePosition(
            'x: ${poseMsg['position']['x'].toStringAsExponential(2)}\n'
            'y: ${poseMsg['position']['y'].toStringAsExponential(2)}\n'
            'z: ${poseMsg['position']['z'].toStringAsExponential(2)}',
            'x: ${poseMsg['orientation']['x'].toStringAsExponential(2)}\n'
            'y: ${poseMsg['orientation']['y'].toStringAsExponential(2)}\n'
            'z: ${poseMsg['orientation']['z'].toStringAsExponential(2)}\n'
            'w: ${poseMsg['orientation']['w'].toStringAsExponential(2)}'); 
        // Formatea los valores de posición y orientación en notación exponencial con 2 cifras decimales y los pasa al método `updatePosition`.

        // Extrae la velocidad lineal y angular del mensaje.
        var twist = decodedMessage['msg']['twist']['twist']; 
        updateVelocity(
            twist['linear']['x'], 
            twist['linear']['y'], 
            twist['linear']['z'], 
            twist['angular']['x'], 
            twist['angular']['y'], 
            twist['angular']['z']); 
        // Actualiza las velocidades usando el método `updateVelocity`.
      }
    });
  }

  // Método para actualizar las variables de posición y orientación.
  void updatePosition(String position, String orientation) { 
    truthPosePosition = position; 
    // Actualiza la posición simulada.
    truthPoseOrientation = orientation; 
    // Actualiza la orientación simulada.
  }

  // Método para actualizar las variables de velocidad lineal y angular.
  void updateVelocity(double linearX, double linearY, double linearZ, 
      double angularX, double angularY, double angularZ) { 
    linearVelocityX = linearX; 
    // Actualiza la velocidad lineal en el eje X.
    linearVelocityY = linearY; 
    // Actualiza la velocidad lineal en el eje Y.
    linearVelocityZ = linearZ; 
    // Actualiza la velocidad lineal en el eje Z.
    angularVelocityX = angularX; 
    // Actualiza la velocidad angular en el eje X.
    angularVelocityY = angularY; 
    // Actualiza la velocidad angular en el eje Y.
    angularVelocityZ = angularZ; 
    // Actualiza la velocidad angular en el eje Z.
  }
}
