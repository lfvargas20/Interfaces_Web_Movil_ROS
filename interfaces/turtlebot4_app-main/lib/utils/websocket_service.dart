
// File: lib/utils/websocket_service.dart {#websocketservice-file}
import 'package:web_socket_channel/web_socket_channel.dart'; 
// Importa la librería `web_socket_channel` para manejar conexiones WebSocket.

import 'dart:convert'; 
// Importa la librería `dart:convert` para convertir datos a formato JSON.

class WebSocketService { 
  // Define una clase para manejar las conexiones WebSocket.
  
  static WebSocketService? _instance; 
  // Una variable estática privada para mantener una única instancia de la clase (Singleton).

  final String serverUrl; 
  // Variable final para almacenar la URL del servidor WebSocket.

  late WebSocketChannel _channel; 
  // Canal WebSocket que se inicializa más adelante.

  // Constructor privado
  WebSocketService._internal({required this.serverUrl}) { 
    // Constructor privado para restringir la creación directa de instancias.
    _connect(); 
    // Llama al método privado para establecer la conexión WebSocket.
  }
  // Método factory para obtener la única instancia
  factory WebSocketService({required String serverUrl}) { 
    // Un constructor factory que retorna siempre la misma instancia.
    _instance ??= WebSocketService._internal(serverUrl: serverUrl); 
    // Si `_instance` es null, crea una nueva instancia con el constructor privado.
    return _instance!; 
    // Retorna la instancia única (Singleton).
  }
  // Getter para acceder al canal WebSocket
  WebSocketChannel get channel => _channel; 
  // Proporciona acceso al canal WebSocket.
  void _connect() { 
    // Método privado para establecer la conexión WebSocket.
    _channel = WebSocketChannel.connect(Uri.parse(serverUrl)); 
    // Inicializa el canal conectándose al servidor usando la URL proporcionada.
  }
  void sendMessage(Map<String, dynamic> message) { 
    // Método público para enviar un mensaje al servidor WebSocket.
    String jsonMessage = jsonEncode(message); 
    // Convierte el mapa en una cadena JSON.
    _channel.sink.add(jsonMessage); 
    // Envía el mensaje JSON al servidor a través del canal WebSocket.
    print("Mensaje enviado: $jsonMessage"); 
    // Imprime el mensaje enviado en la consola (para depuración).
  }
  void closeConnection() { 
    // Método público para cerrar la conexión WebSocket.
    _channel.sink.close(); 
    // Cierra el canal WebSocket.
  }
}
