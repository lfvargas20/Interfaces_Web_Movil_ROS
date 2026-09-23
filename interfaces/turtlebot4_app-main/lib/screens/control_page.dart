import 'package:flutter/material.dart'; 
// Importa las herramientas básicas para construir interfaces de usuario en Flutter.

import 'package:webview_flutter/webview_flutter.dart'; 
// Importa el paquete para mostrar contenido web en la aplicación.

import '../utils/websocket_service.dart'; 
// Importa el servicio WebSocket para comunicarse con el servidor ROS.

import '../widgets/robot_buttons.dart'; 
// Importa un widget personalizado que contiene botones para controlar el robot.

import '../utils/pose_val.dart'; 
// Importa la clase que gestiona los datos de posición y velocidad del robot.

import '../widgets/datos.dart'; 
// Importa widgets personalizados para mostrar datos como posición, orientación y velocidad.

class TurtleBotControlPage extends StatefulWidget { 
  // Define una página con estado (stateful) para controlar el TurtleBot.
  
  const TurtleBotControlPage({super.key}); 
  // Constructor para la clase que incluye una clave única.

  @override
  TurtleBotControlPageState createState() => TurtleBotControlPageState(); 
  // Crea el estado asociado a esta página.
}

class TurtleBotControlPageState extends State<TurtleBotControlPage> { 
  // Clase que define el estado de la página `TurtleBotControlPage`.

  late WebViewController _controller; 
  // Controlador para manejar la interacción con el WebView.

  late WebSocketService _webSocketService; 
  // Instancia para manejar la comunicación WebSocket.

  late PoseAndVelocityManager _poseAndVelocityManager; 
  // Instancia para manejar la posición y velocidad del robot.

  @override
  void initState() { 
    // Método que se ejecuta al inicializar el estado del widget.
    super.initState(); 

    _poseAndVelocityManager = PoseAndVelocityManager(); 
    // Crea una instancia de `PoseAndVelocityManager`.

    _webSocketService = WebSocketService( 
      serverUrl: 'ws://192.168.100.10:9090', 
    ); 
    // Inicializa el servicio WebSocket con la URL del servidor.

    _controller = WebViewController() 
      ..setJavaScriptMode(JavaScriptMode.unrestricted) 
      // Permite el uso de JavaScript sin restricciones en el WebView.
      ..loadRequest(Uri.parse(
          'http://192.168.100.10:8080/stream?topic=/oakd/rgb/preview/image_raw')); 
      // Carga una URL que transmite el video de la cámara del robot.

    _poseAndVelocityManager.subscribeToTopics( 
      _webSocketService, 
      (position, orientation) { 
        setState(() { 
          _poseAndVelocityManager.updatePosition(position, orientation); 
        }); 
      }, 
      // Se suscribe a temas de ROS para obtener posición y orientación.

      (linearX, linearY, linearZ, angularX, angularY, angularZ) { 
        setState(() { 
          _poseAndVelocityManager.updateVelocity(linearX, linearY, linearZ, angularX, angularY, angularZ); 
        }); 
      }
      // Se suscribe a temas de ROS para obtener velocidades lineales y angulares.
    );
  }

  @override
  void dispose() { 
    // Método que se ejecuta al destruir el estado del widget.
    _webSocketService.closeConnection(); 
    // Cierra la conexión WebSocket.
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) { 
    // Método que construye la interfaz de usuario de la página.
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('TurtleBot4 Control'), 
        // Barra superior con el título de la aplicación.
      ),
      body: Column( 
        children: [
          // Video en la parte superior
          Expanded( 
            flex: 1, 
            child: WebViewWidget(controller: _controller), 
            // Muestra el video de la cámara del robot usando el WebView.
          ),
          const SizedBox(height: 1), 
          // Espaciador entre el video y los datos.
          
          // Datos de ROS en la parte inferior
          Expanded( 
            flex: 0, 
            child: SingleChildScrollView( 
              scrollDirection: Axis.horizontal, 
              // Permite desplazamiento horizontal.
              padding: EdgeInsets.all(8.0), 
              // Añade un margen de 8 píxeles alrededor del contenido.
              child: Row( 
                // Los widgets estarán dispuestos en una fila horizontal.
                children: [
                  buildPositionCard(_poseAndVelocityManager.truthPosePosition), 
                  // Muestra una tarjeta con la posición del robot.
                  
                  SizedBox(width: 0.5), 
                  // Espacio entre los elementos.
                  
                  buildOrientationCard(_poseAndVelocityManager.truthPoseOrientation), 
                  // Muestra una tarjeta con la orientación del robot.
                  
                  SizedBox(width: 0.5), 
                  
                  buildVelocityControls( 
                    _poseAndVelocityManager.linearVelocityX, 
                    // Control para la velocidad lineal.
                    _poseAndVelocityManager.angularVelocityZ, 
                    // Control para la velocidad angular.
                    (value) { 
                      setState(() { 
                        _poseAndVelocityManager.linearVelocityX = value; 
                      }); 
                    }, 
                    // Actualiza la velocidad lineal al modificar el control.
                    
                    (value) { 
                      setState(() { 
                        _poseAndVelocityManager.angularVelocityZ = value; 
                      }); 
                    } 
                    // Actualiza la velocidad angular al modificar el control.
                  ),
                ],
              ),
            ),
          ),
          
          // Botones de control
          RobotButtons(webSocketService: _webSocketService), 
          // Muestra los botones personalizados para controlar el robot.
        ],
      ),
    );
  }
}
