# Explicación de la interfaz web

Este documento describe la estructura y el funcionamiento del los archivos que componen la interfaz web del robot TurtleBot 3, explicando línea por línea el propósito de cada sección.

## 1. Requisitos previos

* Conocimientos de HTML, CSS y JavaScript
* Conocimientos de ROS (tópicos, nodos)

## 2. Archivos de la interfaz web

* `index.html`
* `styles.css`
* `index.js`

## 3. Explicación del archivo `index.html`

### 3.1 Línea 1

```html
<!DOCTYPE html>
```

Indica al navegador en qué versión de HTML está escrita la página.

### 3.2 Línea 2

```html
<html lang="en">
```

Indica al navegador que está leyendo un archivo `.html`, definiendo además el idioma principal de la página (en este caso, inglés).

### 3.3 Líneas 3-13

```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TurtleBot 3 Web Interface</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/roslib@1/build/roslib.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/easeljs@1/lib/easeljs.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/eventemitter2@6/lib/eventemitter2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/ros2d@0/build/ros2d.js"></script>
</head>
```

Contiene información técnica de la página que no se muestra directamente en ella, encerrada en la etiqueta `head`. El detalle de cada línea se describe a continuación:

| Línea(s) | Código | Descripción |
|---|---|---|
| 4 | `<meta charset="UTF-8">` | Indica la codificación de caracteres |
| 5 | `<meta name="viewport" content="width=device-width, initial-scale=1.0">` | Indica al navegador las dimensiones y el nivel de zoom de la página |
| 6 | `<title>TurtleBot 3 Web Interface</title>` | Indica el título de la pestaña correspondiente a la página |
| 7-8 | `<link rel="stylesheet" ...>` | Indica los archivos `.css` relacionados a la página, usados para darle diseño |
| 9-12 | `<script src="...roslib..."></script>` etc. | Indica los archivos `.js` de las librerías usadas para ejecutar JavaScript en la página. En este caso se usan las librerías `roslibjs`, `ros2djs` y sus respectivas dependencias |

### 3.4 Líneas 16-208

Contiene el contenido que se visualiza en la página, encerrado en la etiqueta `body`.

#### 3.4.1 Líneas 18-205

Define la separación del contenido visualizado mediante un contenedor `div` principal, dentro del cual se encuentran las diferentes secciones de la página, cada una organizada en su propio contenedor `div`.

| Líneas | Sección | Descripción |
|---|---|---|
| 19-21 | Encabezado | `<div class="grid-item-header">` — Título de la página: "TurtleBot 3 Web Interface" |
| 24-31 | Cámara | Sección de la cámara del robot |
| 33-68 | Mapa | Sección del mapa del entorno del robot |
| 71-116 | Indicadores | Velocidad lineal y angular, alarmas de estabilidad y proximidad |
| 118-196 | Control | Control manual/automático de los robots (ver detalle en 3.4.1.5) |
| 201 | Script | Archivo `.js` usado para ejecutar JavaScript e interactuar con cada sección de la página |

#### 3.4.2 Detalle de la sección de control (líneas 118-196)

| Líneas | Descripción |
|---|---|
| 119 | Título de la sección |
| 121-195 | Contenedor `div` que organiza horizontalmente los tipos de control de los robots |
| 122-155 | Contenedor `div` de la sección de control manual |
| 157-194 | Contenedor `div` de la sección de selección de robots y control automático |

## 4. Explicación del archivo `style.css`

Define la apariencia visual de cada sección y componente de la página. La mayoría de las reglas siguen el mismo patrón: aplican características a los elementos dentro de un contenedor `div` con una clase o `id` determinado.

| Líneas | Etiqueta, clase o ID | Descripción |
|---|---|---|
| 1-9 | `body` | Reglas generales aplicadas a todos los elementos dentro de `body` |
| 11-16 | `h2` | Estilo de los títulos de cada sección de la página |
| 18-25 | `.grid-container` | Estilo del contenedor de las secciones de la página |
| 27-37 | `.grid-item-header` | Estilo del titulo de la página |
| 40-45 | `.grid-item` | Estilo de los contenedores de las secciones de la página |
| 47-50 | `.top-item` | Estilo de los contenedores de las secciones superiores de la página |
| 52-55 | `.low-item` | Estilo de los contenedores de las secciones inferiores de la página |
| 58-62 | `.indicators` | Estilo del contenedor de la sección de indicadores |
| 64-72 | `.indicator-box` | Estilo del contenedor que agrupa los indicadores |
| 74-78 | `.indicator-box-hbox` | Estilo del contenido del contenedor que agrupa el valor del ángulo Roll y la velocidad lineal |
| 81-84 | `.indicator-label` | Estilo de las etiquetas de los indicadores |
| 86-89 | `.indicator-value` | Estilo de los valores de las etiquetas de los indicadores  |
| 91-93 | `.first-label` | Estilo de la etiqueta correspondiente al ángulo Roll |
| 95-97 | `.item1` | Estilo de los valores de los ángulos Roll y Pitch |
| 99-102 | `.item2` | Estilo de la etiqueta de velocidad lineal |
| 104-106 | `.item3` | Estilo de los valores de las velocidades lineal y angular |
| 108-111 | `.item4` | Estilo de la etiqueta de velocidad angular |
| 113-115 | `.item5` | Estilo de la etiqueta de velocidad lineal |
| 117-119 | `.item6` | Estilo de la etiqueta del ángulo Yaw |
| 121-126 | `.buttons-container` | Estilo de los contenedores de control manual y automático |
| 128-132 | `.vbox-buttons` | Estilo del contenedor de los botones de rotación y stop del control manual |
| 134-140 | `.button` | Estilo de los botones de control manual |
| 142-145 | `.button:hover` | Apariencia de los botones al pasar el cursor sobre ellos |
| 158-162 | `.horizontal-container` | Organización de los contenedores de control manual y automáticov |
| 164-169 | `.vertical-container` | Estilo de las etiquetas y entradas del control automático |
| 171-176 | `.horizontal-container-pose` | Organización de las etiquetas y entradas del control automático |
| 178-180 | `.navigation-container` | Organización de las etiquetas y entradas del control automático |
| 182-188 | `.navigation-button` | Estilo de los botones del control automático |
| 190-195 | `.nav-button` | Organización de los botones del control automático |
| 197-203 | `.input-field` |  Estilo de las entradas del control automático |
| 205-209 | `.canvas-container` | Organización del contenedor del mapa |
| 211-213 | `.label` | Estilo y organización de las etiquetas de los ejes del mapa |
| 215-222 | `.vertical-label-container` | Organización de los valores del eje `y` del mapa |
| 224-230 | `.horizontal-label-container` | Organización de los valores del eje `x` del mapa |
| 232-236 | `#x-label` | Estilo de los valores del eje `x` del mapa |
| 238-241 | `#y-label` | Estilo de los valores del eje `y` del mapa |
| 243-246 | `.goal-status` | Estilo del texto de la sección de control automático que informa si la navegación fue iniciada, completada o cancelada |
| 248-255 | `.grouped-fields` | Organización del contenedor de los checkboxes de los robots |
| 257-260 | `.field` | Organización de los checkboxes de los robots |
| 262-264 | `.radio-checkbox input[type="radio"]:checked + label` | Estilo de las etiquetas de los checkboxes de los robots |
| 266-268 | `#robot1` | Color del checkbox del primer robot |
| 270-272 | `#robot2` | Color del checkbox del segundo robot |
| 283-285 | `.radio-checkbox label::before` | Estilo de los checkboxes de los robots |
| 287-291 | `.legend` | Organización y estilo de las etiquetas de los robots en la sección del mapa |

## 5. Explicación del archivo `index.js`

### 5.1 Conexión con Rosbridge (líneas 2-19)

| Líneas | Descripción |
|---|---|
| 2-6 | Conexión de la página web al servidor Rosbridge |
| 8-11 | Confirmación de la conexión por consola |
| 13-15 | Confirmación de error por consola |
| 17-19 | Confirmación de desconexión del servidor Rosbridge por consola |

### 5.2 Variables de tópicos generales (líneas 23-88)

| 5.2.x | Líneas | Tópico | Descripción |
|---|---|---|---|
| 5.2.1 | 23-27 | `/clock` | Variable constante que almacena el tópico del reloj de simulación |
| 5.2.2 | 30-34 | `/tb3_1/map` | Mapa del entorno (mensajes `OccupancyGrid`) |
| 5.2.3 | 38-42 | `/tb3_1/odom` | Odometría del primer robot. Usado en la sección de indicadores |
| 5.2.4 | 44-48 | `/tb3_2/odom` | Odometría del segundo robot. Usado en la sección de indicadores |
| 5.2.5 | 51-55 | `/tb3_1/odom` | Odometría del primer robot. Usado en la sección del mapa |
| 5.2.6 | 57-61 | `/tb3_2/odom` | Odometría del segundo robot. Usado en la sección del mapa |
| 5.2.7 | 66-70 | `/tb3_1/scan` | Datos del sensor LiDAR del primer robot. Usado en indicadores |
| 5.2.8 | 72-76 | `/tb3_2/scan` | Datos del sensor LiDAR del segundo robot. Usado en indicadores |
| 5.2.9 | 78-82 | `/tb3_1/imu` | Velocidad y orientación del primer robot. Usado en indicadores |
| 5.2.10 | 84-88 | `/tb3_2/imu` | Velocidad y orientación del segundo robot. Usado en indicadores |

### 5.3 Aislamiento de comandos de velocidad (líneas 92-134)

Variable y funciones que permiten aislar los envíos de comandos de velocidad de cada robot.

### 5.4 Variables de navegación autónoma (líneas 139-214)

Usadas en la sección de control manual/automático:

| 5.4.x | Líneas | Tópico | Servicio | Descripción |
|---|---|---|---|---|
| 5.4.1 | 139-143 | `/tb3_1/start_navigation` | - | Booleano para iniciar la navegación autónoma del primer robot |
| 5.4.2 | 145-149 | `/tb3_2/start_navigation` | - | Booleano para iniciar la navegación autónoma del segundo robot |
| 5.4.3 | 152-156 | `/tb3_1/pose_x` | - | Posición en `x` de la coordenada de destino del primer robot |
| 5.4.4 | 158-162 | `/tb3_1/pose_y` | - | Posición en `y` de la coordenada de destino del primer robot |
| 5.4.5 | 164-168 | `/tb3_1/pose_yaw` | - | Ángulo de la coordenada de destino del primer robot |
| 5.4.6 | 170-174 | `/tb3_2/pose_x` | - | Posición en `x` de la coordenada de destino del segundo robot |
| 5.4.7 | 176-180 | `/tb3_2/pose_y` | - | Posición en `y` de la coordenada de destino del segundo robot |
| 5.4.8 | 182-186 | `/tb3_2/pose_yaw` | - | Ángulo de la coordenada de destino del segundo robot |
| 5.4.9 | 191-195 | `/tb3_1/navigation_status` | - | Texto que indica si la navegación del primer robot fue exitosa o cancelada |
| 5.4.10 | 197-201 | `/tb3_2/navigation_status` | - | Texto que indica si la navegación del segundo robot fue exitosa o cancelada |
| 5.4.11 | 204-208 | - | `/tb3_1/navigate_to_pose/_action/cancel_goal` | Cancela la navegación autónoma del primer robot |
| 5.4.12 | 210-214 | - | `/tb3_2/navigate_to_pose/_action/cancel_goal` | Cancela la navegación autónoma del segundo robot |

### 5.5 Elementos del DOM de robots (líneas 220-221)

Variables que almacenan los elementos con `id` `robot1` y `robot2`, correspondientes al primer y segundo robot.

### 5.6 Función de control del primer robot (líneas 227-420)

Agrega la información del primer robot a la página y permite controlarlo manualmente mediante suscripción y publicación a sus tópicos respectivos.

| Líneas | Descripción |
|---|---|
| 229-235 | Desuscripción de los tópicos que no corresponden al primer robot |
| 238 | Selección del tópico de comando de velocidad, usando las funciones/variables de 5.3 |
| 241-250 | Variables y funciones para ajustar el video del servidor `web-video-server` en la sección de cámara |
| 252-254 | Espacios de texto correspondientes a los ángulos RPY del primer robot |
| 256 | Espacio de texto correspondiente a la alarma de proximidad del primer robot |
| 259-277 | Suscripción a `/tb3_1/scan`: organiza los datos del LiDAR en una lista, elimina valores nulos y agrega texto indicando si el robot está a menos de 0.2 m de un obstáculo |
| 279-280 | Espacios de texto correspondientes a las velocidades lineal y angular del primer robot |
| 284-285 | Variables de comando de velocidad lineal y angular, inicializadas en 0.00 m/s y 0.00 rad/s |
| 290-301 | Mensaje tipo `Twist` con el comando de velocidad del primer robot, construido con las variables anteriores |
| 303-343 | Botones del control manual y sus manejadores de eventos: incrementan/disminuyen la velocidad y publican el mensaje `Twist` al tópico correspondiente |
| 345-358 | Suscripción a la odometría (5.2.3): obtiene velocidad lineal/angular en tiempo real y actualiza los espacios de texto |
| 360-404 | Suscripción al IMU (5.2.9): convierte cuaterniones a ángulos Euler y actualiza los espacios de texto en tiempo real |
| 406-418 | Suscripción al estado de navegación (5.4.9): muestra en la página si la navegación autónoma tuvo éxito o fue cancelada |

### 5.7 Función de control del segundo robot (líneas 422-610)

Ejecuta los mismos procesos que la función de 5.6, aplicados al segundo robot.

### 5.8 Mapa del entorno (líneas 621-875)

| Líneas | Descripción |
|---|---|
| 621-739 | Variables y funciones para crear el espacio donde se aloja el mapa del entorno en la página |
| 742-864 | Suscripción al mapa (5.2.2): recibe las celdas del mensaje, redimensiona el mapa al tamaño del espacio disponible, representa a los robots como círculos de colores y dibuja sus trayectorias en tiempo real mediante suscripción simultánea a la odometría (5.2.5) |
| 867-868 | Variables de posición `x` e `y`, inicializadas en `0` |
| 872-875 | Suscripción a la odometría (5.2.6) que actualiza las variables anteriores, usadas en el proceso de 742-864 |

### 5.9 Nota
El proceso de las líneas 872-875 se ejecuta dentro del proceso de las líneas 742-864.

### 5.10 Control automático / navegación a coordenadas (líneas 883-1010)

| Líneas | Descripción |
|---|---|
| 883-885 | Espacios de texto de las entradas de coordenadas de destino del control automático (`x`, `y`, `θ`) |
| 887-963 | Función que toma esas coordenadas, inicia la navegación autónoma del robot seleccionado y dibuja un círculo amarillo en el mapa marcando el destino |
| 965-1010 | Función que envía una petición para cancelar la navegación autónoma del robot seleccionado, lo detiene y procesa la respuesta de la petición |

