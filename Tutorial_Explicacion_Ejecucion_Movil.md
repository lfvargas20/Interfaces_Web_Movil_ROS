Documentación APP turtlebot4_app
 
# Documentación de Aplicación  TurtleBot4 Control & Video

Este proyecto permite controlar un TurtleBot4 en simulación mediante una aplicación móvil. La app está diseñada para ofrecer control en tiempo real, visualización de datos como posicion y velocidad y transmisión de video desde una cámara RGB.

---

## 🚀 Objetivos
El objetivo de esta aplicación es permitir:
- Controlar el robot mediante botones.
- Mostrar datos como velocidad, posición y orientación del robot.
- Integrar la transmisión de video en tiempo real desde una cámara RGB.
---

## 🛠️ Herramientas

- **Backend**: ROS 2 Humble.
- **Frontend móvil**: Flutter-Visual Studio Code.
- **Otros paquetes ROS 2**:
  - Nav2.
  - Turtlebot4_bringup.
  - web_video_server.
  -rosbridge_server

---
## 📝 Requisitos

- ROS 2 Humble y todos los paquetes necesarios instalados.
- Conexión a la red entre la aplicación móvil y el servidor ROS.
- Flutter instalado para la ejecución del frontend móvil.

---
## ⚙️ Instalación

### 1. **Configuración de ROS 2 Humble**

#### 1.1 **Instalar y configurar rosbridge_server**

Instala el paquete `rosbridge_server` en tu entorno ROS 2:

```bash
sudo apt install ros-humble-rosbridge-server
```

Lanzar el archivo de lanzamiento predeterminado en Ros 2 para iniciar el servidor WebSocket de rosbridge, usa el siguiente comando:
```bash
ros2 launch rosbridge_server rosbridge_websocket_launch.xml
```
Este comando activara el servidor en el puerto predeterminado 9090

  ---
#### 1.2 **Instalar y configurar web_video_server**

Instala el paquete web_video_server en tu entorno Ros 2:
```bash
sudo apt install ros-humble-web-video-server
```
Para ejecutar el nodo directamente, usa el siguiente comando:
```bash
ros2 run web_video_server web_video_server
```
Esto inicia el servidor de video en el puerto predeterminado (8080). Puedes acceder al stream de video en tu navegador web usando la dirección:
```bash
http://<IP_DEL_HOST>:8080/stream?topic=/oakd/rgb/preview/image_raw
```
Asegúrate de reemplazar <IP_DEL_HOST> con la dirección IP del equipo donde está corriendo el servidor (o localhost si estás en la misma máquina).

---
  
### 2. **Instalación de Flutter** 
En la pagina oficial de flutter https://docs.flutter.dev/get-started/install escoger el sistema operativo en el que desea instalar flutter, en esta ocasion escogeremos linux 
![imagen](https://github.com/user-attachments/assets/e45c982f-148f-47bc-8245-d1f7d556162a)
y posteriormente Desktop para instalarlo en la computadora 
![imagen](https://github.com/user-attachments/assets/55623010-269c-47d3-98b2-bf60e64a7f48)
Aqui se puede revisar los requisitos tanto de Software y Hardware que necesita la computadora para poder instalar y ejecturar Flutter 
#### Requisitos de Hardware para instalar Flutter #### 
![imagen](https://github.com/user-attachments/assets/3ced0dce-55aa-4ccb-b597-5197324c30e8)

####  Requisitos de software para instalar Flutter #### 
Para escribir y compilar el código Flutter para el escritorio, debe tener la siguiente versión de Linux y los paquetes de software listados. 
 -- Instale los siguientes paquetes: curl, git, unzip, xz-utils, zip, libglu1-mesa
 ```bash
sudo apt-get update -y && sudo apt-get upgrade -y;
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa
```
Para desarrollar las aplicaciones de Linux, utilice el siguiente comando para instalar estos paquetes:
clang, cmake, ninja-build, pkg-config, libgtk-3-dev, libstdc++-12-dev

 ```bash
sudo apt-get install \
      clang cmake git \
      ninja-build pkg-config \
      libgtk-3-dev liblzma-dev \
      libstdc++-12-dev
```
####  Instalar el SDK de Flutter #### 
Para instalar Flutter, descargue el paquete de Flutter SDK de su archivo, mueva el paquete a donde lo desee almacenado, luego extraiga el SDK.
1. Descargue el siguiente paquete de instalación para obtener la última versión estable del Flutter SDK. 
![imagen](https://github.com/user-attachments/assets/7e50d7aa-7df4-4f44-af62-6e44ecc60aab)
2. Extraer el archivo directorio que se desea almacenar el Flutter SDK con el siguiente comando
```bash
tar -xf ~/Descargas/flutter_linux_3.27.3-stable.tar.xz 
```
3.  Mover FLutter al directorio opt con el siguiente comando
   ```bash
sudo mv flutter /opt/
```
####  Agregar Flutter al PATH #### 
Abrir el archivo de configuraciòn de tu Shell con el siguiente comando 
```bash
nano ~/.bashrc
```
Y agregar esta linea al final del archivo
```bash
export PATH="$PATH:/opt/flutter/bin"
```
Podemos verificar la version de flutter con el siguiente comando para verificar que se haya instalado correctamente 
```bash
flutter --version
```
Esta salida confirma que tienes Flutter correctamente instalado y proporciona información clave sobre las versiones del framework, el motor, y las herramientas.
 ![imagen](https://github.com/user-attachments/assets/18fce2ca-455e-485c-8a7a-5de09b45973b)

#### Flutter doctor ####
Con el comando ``` flutter --version ``` es una herramienta de diagnóstico incluida en Flutter que sirve para verificar el estado de tu entorno de desarrollo y asegurarte de que tienes todo correctamente configurado para desarrollar aplicaciones con Flutter.
![imagen](https://github.com/user-attachments/assets/c0849a98-fafa-4c4d-b24a-45c40a8527af)
En esta ocasion podemos observar que nos faltan algunos requerimientos entre ellos Android Studio que es fundamental para poder desarrollar aplicaciones en Flutter

### 3. **Instalaciòn de Android Studio** 
1. Visitar el sitio oficial de Android Studio y descargar el archivo .tar.gz https://developer.android.com/studio?hl=es-419
   ![imagen](https://github.com/user-attachments/assets/5020bfd1-8d45-44bb-bc10-5ed0b2c91dcd)
   
2. Dar click en el apartado de "Descarga la actualizacion de funciones de Android Studio Ladybug" y Aceptar los terminos y condiciones

[Grabación de pantalla desde 26-01-25 18:04:52.webm](https://github.com/user-attachments/assets/8ce518ff-007d-4ae9-ae43-98ad21098457) 

4. Extraer el contenido del archivo descargado con el siguiente comando
```bash
tar -xvzf ~/Descargas/android-studio-2024.2.2.13-linux.tar.gz 
```
4. Inicia el Instalador de Android Studio con el siguiene comando y aceptar los terminos y condiciones 
 ```bash
/opt/android-studio/bin/studio.sh
```
5. Agregar Android Studio al PATH esto ayudara a ejecturar Android Studio desde cualquier lugar en la terminal
```bash
nano ~/.bashrc
```
6. Escribir la siguiente linea al final del archivo
```bash
export PATH="$PATH:/opt/android-studio/bin"
```
7.  Guarda los cambios y actualizar el Shell con el siguiente comando 
```bash
source ~/.bashrc
```  
8. Volvemos a verificar con el comando ``` flutter doctor ``` y confirmamos que todo este instalado
![imagen](https://github.com/user-attachments/assets/21218cc9-6ce3-4003-ad0f-f6d5a63d9933)

### Colocar dispositivo móvil en modo desarrollador para utilizarlo como emulador ### 
Un emulador en Flutter es útil porque permite simular dispositivos móviles para desarrollar y probar aplicaciones sin necesidad de un hardware físico, ofreciendo opciones para emular diferentes resoluciones, versiones de sistemas operativos y escenarios específicos. Sin embargo, usar un celular físico es mejor para evaluar el rendimiento real de la aplicación, probar interacciones táctiles precisas y verificar cómo funciona en condiciones reales, como conectividad, sensores y recursos limitados, lo que resulta esencial para asegurar una experiencia de usuario óptima.

[Emulador.webm](https://github.com/user-attachments/assets/3fe0d5be-e438-4175-a0ec-ae315fd68dba)

### 4. **Clonar el repositorio**:

Crea un directorio en donde vayas almacenar el repositorio y porteriormente clonalo con el siguiente comando
```bash
git clone https://github.com/greicyd/turtlebot4_app.git
```

 Descargar las dependencias que se encuentran en el archivo pubspec.yaml con el siguiente comando, esto permitirá descargar las dependencias necesarias para el proyecto 
 ```bash
flutter pub get 
```
![imagen](https://github.com/user-attachments/assets/f955f7d5-4e07-4c00-a12f-1976f712bb56)

Para poder utilizar tu dispositivo movil fisico como emulador, se debe de activar en modod desarrollador como se describió anteriormente, posteriormente conectar el celular a la computadora mediante un cable USB, y aceptar que se conecte con este dispositivo. De esta forma el celular podrá ser utilizado como un emulador.

Para correr la ejecutar la aplicación con el comando 
```bash
flutter run
```
[Grabación de pantalla desde 27-01-25 02:13:54.webm](https://github.com/user-attachments/assets/4ecf508e-8a34-4e8e-badf-a1e27a6f5c20)

## Tutorial de comandos para ejecutar la aplicación:

Los comandos que se deben ejecutar en el terminal deben seguir el siguente orden:
 ```bash
ros2 launch turtlebot4_ignition_bringup turtlebot4_ignition.launch.py
```
 ```bash
ros2 launch rosbridge_server rosbridge_websocket_lauch.xml
```
 ```bash
ros2 run web_video_server web_video_server
```
## Tutorial de comandos: https://youtu.be/6dWMH1nb9WA
 ---
## 🗂️ Estructura del Proyecto
El proyecto está organizado en varias carpetas y archivos, cada uno con una función específica:

   - lib/screens: Contiene las pantallas principales de la aplicación.
   - lib/widgets: Contiene los widgets reutilizables para los controles del robot y visualización de datos.
   - lib/utils: Contiene servicios como WebSocket para comunicación con ROS y gestión de la posición y velocidad del robot.
   - main: Contiene el código que se ejecutará cuando el programa arranca.

 ---
 
## 📜 Código Explicado
## Conexión WebSocket

El código define una clase llamada `WebSocketService` que maneja las conexiones WebSocket. A través de esta clase, se proporciona una manera centralizada para conectarse, enviar mensajes y cerrar las conexiones WebSocket.

#### Importaciones:
- **`package:web_socket_channel/web_socket_channel.dart`**: Importa la librería que facilita la gestión de las conexiones WebSocket.
- **`dart:convert`**: Importa la librería para convertir datos a formato JSON.

#### Clase `WebSocketService`:
Esta clase se encarga de gestionar las comunicaciones WebSocket con un servidor. Implementa el patrón de diseño Singleton, asegurando que solo exista una instancia activa en toda la aplicación.

### Descripción de su Funcionamiento:

#### Constructor Privado:
- **`WebSocketService._internal({required this.serverUrl})`**:  
  Es el constructor privado, que inicializa la conexión WebSocket. Solo se puede invocar a través del factory constructor para garantizar que se crea una sola vez.

#### Factory Constructor:
- **`factory WebSocketService({required String serverUrl})`**:  
  Utiliza el patrón Singleton, comprobando si ya existe una instancia (`_instance`). Si no existe, crea una nueva y la devuelve. Si ya existe, retorna la misma instancia.

#### Método `_connect()`:
- **`_connect()`**:  
  Este método se ejecuta en el constructor privado para establecer la conexión WebSocket. Utiliza la URL proporcionada para conectar al servidor y crea un canal WebSocket.

#### Getter `channel`:
- **`WebSocketChannel get channel`**:  
  Proporciona acceso al canal WebSocket una vez establecida la conexión.

#### Método `sendMessage()`:
- **`sendMessage(Map<String, dynamic> message)`**:  
  Este método convierte un mapa de datos en formato JSON y lo envía a través del canal WebSocket. El mensaje JSON se envía al servidor, y se imprime el mensaje enviado para depuración.

#### Método `closeConnection()`:
- **`closeConnection()`**:  
  Cierra la conexión WebSocket, liberando los recursos utilizados para la comunicación.

[WebSocketService](https://github.com/greicyd/turtlebot4_app/blob/main/lib/utils/websocket_service.dart)

 ---
 
## Control del Robot

El código define un widget llamado `RobotButtons`, el cual permite controlar el movimiento de un robot mediante botones en una interfaz gráfica. El widget es un **StatelessWidget**, lo que significa que no mantiene el estado, sino que solo devuelve una representación de su diseño cuando es construido.

## Importaciones

- **`package:flutter/material.dart`**: Importa los widgets básicos de Flutter, necesarios para crear la interfaz gráfica.
- **`../utils/websocket_service.dart`**: Importa un servicio local que maneja la comunicación WebSocket con el robot.

## Clase `RobotButtons`

La clase `RobotButtons` es un widget sin estado que define el diseño y la lógica para controlar el robot.

### Constructor

- **`RobotButtons({Key? key, required this.webSocketService})`**:
  - Recibe como argumento una instancia de `WebSocketService`, que se utiliza para enviar mensajes al robot.

### Métodos

- **`_moveForward()`**: 
  - Envia un mensaje al WebSocket para que el robot se mueva hacia adelante. 
  - Utiliza el servicio WebSocket para enviar una operación (`"publish"`) al tópico `/cmd_vel` con un movimiento lineal hacia adelante en el eje X.

- **`_moveBackward()`**: 
  - Envia un mensaje al WebSocket para que el robot se mueva hacia atrás.
  - Utiliza valores negativos en el eje X para indicar un movimiento contrario.

- **`_turnLeft()`**: 
  - Envia un mensaje al WebSocket para girar el robot hacia la izquierda, aplicando una rotación angular positiva en el eje Z.

- **`_turnRight()`**: 
  - Envia un mensaje al WebSocket para girar el robot hacia la derecha, aplicando una rotación angular negativa en el eje Z.

- **`_stop()`**: 
  - Envia un mensaje al WebSocket para detener cualquier movimiento del robot.
  - Establece ambos componentes lineales y angulares a 0.

### Función `build`

- **`Column`**:
  - Define la estructura del widget, organizando los botones en una columna. 
  - **`ElevatedButton`**:
    - Botones elevados que proporcionan retroalimentación visual al ser presionados.
  - **`onPressed`**:
    - Vincula cada botón a una función específica (`_moveForward`, `_turnLeft`, `_stop`, `_turnRight`, `_moveBackward`).
  - **`Text`**:
    - Texto visible en cada botón que indica la acción (Avanzar, Girar Izquierda, Detener, Girar Derecha, Retroceder).
  - **`SizedBox`**:
    - Añade espacio entre los botones para mejorar la legibilidad.


[Robot_buttons](https://github.com/greicyd/turtlebot4_app/blob/main/lib/widgets/robot_buttons.dart)

## Gestión de Posición y Velocidad:

El código define una clase llamada `PoseAndVelocityManager`, la cual se encarga de gestionar la posición, orientación y velocidad en un entorno de simulación. A través de esta clase, se puede suscribir a temas en un sistema ROS (Robot Operating System) mediante una conexión WebSocket y actualizar la posición y velocidad según los datos recibidos.

#### Importaciones:
- **`dart:convert`**:  
  Importa la biblioteca para codificar y decodificar JSON, lo que permite interpretar los mensajes que llegan desde el servidor.

- **`../utils/websocket_service.dart`**:  
  Importa la clase `WebSocketService` para manejar las conexiones WebSocket, permitiendo la suscripción y recepción de datos desde el servidor.

#### Clase `PoseAndVelocityManager`:
Esta clase define las variables necesarias para almacenar la posición y orientación, así como las velocidades lineales y angulares en un entorno de simulación.

### Descripción del Funcionamiento:

#### Variables de Clase:
- **`TruthPosePosition`** y **`TruthPoseOrientation`**:  
  Almacenan la posición y orientación actuales de la simulación como cadenas.  

- **`linearVelocityX`, `linearVelocityY`, `linearVelocityZ`** y **`angularVelocityX`, `angularVelocityY`, `angularVelocityZ`**:  
  Variables que almacenan las velocidades lineales y angulares.

#### Método `subscribeToTopics()`:
Este método se encarga de suscribirse al tema `"/odom"` mediante la conexión WebSocket proporcionada por `WebSocketService`.

- **`webSocketService.sendMessage({"op": "subscribe", "topic": "/odom"})`**:  
  Envia un mensaje al servidor para suscribirse al tema que contiene los datos de odometría.

- **`webSocketService.channel.stream.listen((message) {...})`**:  
  Escucha los mensajes que llegan a través del canal WebSocket. Estos mensajes están en formato JSON.

- **`jsonDecode(message)`**:  
  Decodifica el mensaje JSON recibido, permitiendo acceder a la información contenida.

- **`decodedMessage['topic'] == '/odom'`**:  
  Verifica que el mensaje proviene del tema `/odom`, que contiene la odometría del robot.

- **`updatePosition()`**:  
  Extrae la posición y orientación del mensaje y llama al método `updatePosition` para actualizar las variables correspondientes.

- **`updateVelocity()`**:  
  Extrae las velocidades lineales y angulares y llama al método `updateVelocity` para actualizar las velocidades almacenadas.

#### Método `updatePosition()`:
Este método se encarga de actualizar las variables de posición y orientación simulada.

- **`simGroundTruthPosePosition`**:  
  Se actualiza con los datos de posición.

- **`simGroundTruthPoseOrientation`**:  
  Se actualiza con los datos de orientación.

#### Método `updateVelocity()`:
Este método se encarga de actualizar las velocidades lineales y angulares.

- **`linearVelocityX`, `linearVelocityY`, `linearVelocityZ`**:  
  Se actualizan con los valores de velocidad lineal.

- **`angularVelocityX`, `angularVelocityY`, `angularVelocityZ`**:  
  Se actualizan con los valores de velocidad angular.

[Position_Velocity](https://github.com/greicyd/turtlebot4_app/blob/main/lib/utils/pose_val.dart)

---
## Creación de Widgets para Visualización de datos

El código define tres widgets en Flutter que se encargan de la construcción de tarjetas (Cards) y sliders interactivos para mostrar información relacionada con la posición, orientación y velocidades lineales y angulares.

#### Importación:
- **`package:flutter/material.dart`**: Importa la biblioteca principal de Flutter que proporciona los widgets esenciales para construir interfaces de usuario.

### 1. `buildPositionCard(String position)`
Este widget crea una tarjeta que muestra la posición mediante un ícono, un texto descriptivo y el valor de la posición.

- **Card**: Proporciona una estructura básica para presentar contenido con un fondo estilizado y sombra.
- **Icon**: Muestra un ícono de ubicación con un color azul.
- **Text**: Muestra un texto que indica "Position" y luego el valor recibido como argumento `position`.
- **SizedBox**: Añade espacio entre los elementos para mejorar la legibilidad.

### 2. `buildOrientationCard(String orientation)`
Similar al primero, pero esta tarjeta muestra la orientación del objeto. Utiliza un ícono de rotación.

- **Icon**: Utiliza un ícono de rotación con color naranja.
- **Text**: Muestra el título "Orientation" y el valor recibido como argumento `orientation`.
- **SizedBox**: Incluye espaciadores para separación visual.

### 3. `buildVelocityControls(double linearVelocityX, double angularVelocityZ, Function(double) onLinearChanged, Function(double) onAngularChanged)`
Este widget crea un conjunto de controles deslizantes que permiten ajustar velocidades lineales y angulares.

- **Card**: Proporciona una tarjeta con efecto de sombra para destacar los controles.
- **buildSlider**: Un método que crea el control deslizante para ajustar las velocidades lineales y angulares.

### 4. `buildSlider(String label, double value, Function(double) onChanged)`
Este widget genérico construye un control deslizante. Recibe un texto de etiqueta, un valor inicial y una función que se llama al cambiar el valor.

- **Column**: Organiza los elementos verticalmente.
- **Text**: Muestra el texto de la etiqueta del control deslizante.
- **Slider**: Proporciona un control deslizante con rango entre -2.0 y 2.0, con pasos de 5 divisiones.
- **SliderTheme**: Estiliza el deslizador con un círculo de tamaño fijo como control del valor.

### Funcionamiento:
- Cada uno de estos widgets devuelve una tarjeta con contenido específico (posición, orientación o controles de velocidad).
- Utilizan `Card` para estructurar visualmente el contenido.
- Incorporan elementos como `Icon`, `Text` y `Slider` para mostrar datos e interactividad.
- `SizedBox` y `Padding` se utilizan para añadir espaciado entre los elementos, mejorando la claridad visual.

Estos widgets están diseñados para que se puedan utilizar fácilmente en interfaces de usuario de aplicaciones Flutter para mostrar y manejar información relacionada con la posición, orientación y velocidad de objetos en movimiento.

[Widgets_datos](https://github.com/greicyd/turtlebot4_app/blob/main/lib/widgets/datos.dart)

---
## Control del Robot

El código define una página de Flutter llamada `TurtleBotControlPage` destinada a controlar un robot utilizando una interfaz gráfica. La página se establece como **StatefulWidget**, lo que significa que su estado puede cambiar durante la ejecución, y está diseñado para interactuar con WebSocket para enviar y recibir comandos y datos del robot.

#### Importaciones:
- **`package:flutter/material.dart`**: Importa las herramientas básicas de Flutter para crear interfaces de usuario.
- **`package:webview_flutter/webview_flutter.dart`**: Importa el paquete que permite mostrar contenido web, como el video en vivo del robot.
- **`../utils/websocket_service.dart`**: Importa el servicio WebSocket, utilizado para manejar la comunicación con el servidor ROS.
- **`../widgets/robot_buttons.dart`**: Importa un widget personalizado con botones para controlar el robot.
- **`../utils/pose_val.dart`**: Importa la clase que gestiona los datos de posición y velocidad del robot.
- **`../widgets/datos.dart`**: Importa widgets personalizados para mostrar datos como posición, orientación y velocidad del robot.

#### Clase `TurtleBotControlPage`:
- **`TurtleBotControlPage`**: Define la página con estado. Utiliza un constructor para inicializar la página.
- **`TurtleBotControlPageState`**: Define el estado asociado a la página. Se encarga de gestionar la interacción del usuario con el WebView y WebSocket.

#### Metodología:
- **`initState()`**:  
  Este método se ejecuta cuando se inicializa el estado de la página. Aquí se configura:
  - `WebViewController` para cargar el video del robot.
  - `WebSocketService` para establecer la comunicación con el servidor.
  - `PoseAndVelocityManager` para manejar la posición y velocidad del robot.
  - Se suscribe a los temas de ROS que envían datos del robot como posición, orientación, y velocidad.

- **`dispose()`**:  
  Al cerrar la aplicación o la página, este método cierra la conexión WebSocket y libera recursos.

- **`build()`**:  
  Define la interfaz de usuario utilizando un `Scaffold` con:
  - **`WebViewWidget`**: Muestra el video en vivo desde la cámara del robot.
  - **`Expanded`**: Organiza los widgets en columnas o filas que se expanden automáticamente para ocupar el espacio disponible.
  - **`RobotButtons`**: Muestra los botones personalizados para controlar el robot, como avanzar, retroceder, girar, y detener.

#### Widgets Utilizados:
- **`WebViewWidget`**: Muestra el video desde la cámara del robot usando el WebView.
- **`SingleChildScrollView`**: Permite desplazamiento horizontal para mostrar los datos como posición, orientación y velocidad del robot.
- **`buildPositionCard()`** y **`buildOrientationCard()`**: Widgets personalizados para mostrar la posición y orientación del robot.
- **`buildVelocityControls()`**: Widgets para controlar las velocidades lineales y angulares del robot.

#### Funcionamiento:
Se crea una interfaz gráfica para controlar el robot, mostrando en tiempo real la posición, orientación, y velocidad. También permite enviar comandos al robot a través del WebSocket utilizando botones personalizados para interactuar con los movimientos y detener al robot. Además, el WebView muestra la transmisión en vivo de la cámara del robot, proporcionando una experiencia visual integral para el usuario.

[Control_Robot](https://github.com/greicyd/turtlebot4_app/blob/main/lib/screens/control_page.dart)

---
## Main

El código representa la entrada principal de la aplicación  que controla al robot TurtleBot4. A través de este código, se inicializa la aplicación, se establece el tema y se define la página principal que interactúa con el robot.

#### Importaciones:
- **`package:flutter/material.dart`**:  
  Importa los widgets básicos de Flutter necesarios para la construcción de la interfaz gráfica.
- **`screens/control_page.dart`**:  
  Importa la página `TurtleBotControlPage`, que contiene la lógica y la interfaz para el control del robot.

### Descripción de su Funcionamiento:

#### Función `main()`:
- **`void main()`**:  
  Es la función principal de la aplicación Flutter que se ejecuta al iniciar la aplicación.  
  - **`runApp(const MyApp())`**:  
    Inicia la aplicación llamando al widget `MyApp`.

#### Clase `MyApp`:
- **`class MyApp extends StatelessWidget`**:  
  Esta clase define el widget raíz de la aplicación. Es un widget sin estado (`StatelessWidget`), lo que significa que no mantiene el estado entre las re-construcciones de la interfaz.

- **`@override Widget build(BuildContext context)`**:  
  Define cómo se construye la interfaz de la aplicación.  
  - **`MaterialApp`**:  
    Es el widget principal que configura la apariencia y la estructura de la aplicación.  
    - **`title`**:  
      Define el título de la aplicación, en este caso, "TurtleBot4 Control & Video".  
    - **`theme`**:  
      Configura el tema de la aplicación con un color base azul (`primarySwatch: Colors.blue`).  
    - **`home`**:  
      Define la página inicial de la aplicación, que es `TurtleBotControlPage()`.

#### `TurtleBotControlPage`:
- **`const TurtleBotControlPage()`**:  
  Es el widget que muestra la interfaz gráfica para el control del robot TurtleBot4. Se espera que esta página proporcione los controles necesarios para interactuar con el robot.

[Main](https://github.com/greicyd/turtlebot4_app/blob/main/lib/main.dart)

---
## Resultados esperados

## Proyecto Funcional: https://youtu.be/BrllJuRdWXA

---
## 🧪 Pruebas y Validación

Para probar y validar la aplicación:

 1. Verificar la conexión entre ROS y la app móvil.
 2. Validar que los comandos enviados desde la app se reflejen correctamente en la simulación.
 3. Probar la transmisión de video en tiempo real usando la cámara RGB del robot.





