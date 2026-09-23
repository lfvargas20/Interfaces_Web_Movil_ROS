import 'package:flutter/material.dart'; 
// Importa la biblioteca principal de Flutter para construir interfaces de usuario.

// Widget que construye una tarjeta para mostrar una posición.
Widget buildPositionCard(String position) {
  return Card(
    elevation: 5, 
    // Define la elevación de la tarjeta, que da un efecto de sombra.
    child: Padding(
      padding: const EdgeInsets.all(8.0), 
      // Añade un relleno uniforme de 8 píxeles alrededor del contenido de la tarjeta.
      child: Column(
        children: [
          Icon(Icons.location_on, color: Colors.blue, size: 20), 
          // Muestra un ícono de ubicación con color azul y tamaño 20.
          SizedBox(height: 5, width: 5), 
          // Espaciador de 5 píxeles en alto y ancho.
          Text('Position', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), 
          // Texto que indica "Position" con fuente de tamaño 16 y negrita.
          SizedBox(height: 5, width: 5), 
          // Espaciador adicional para separar el texto.
          Text(position, style: TextStyle(fontSize: 14)), 
          // Muestra la posición recibida como argumento con tamaño de fuente 14.
        ],
      ),
    ),
  );
}

// Widget que construye una tarjeta para mostrar una orientación.
Widget buildOrientationCard(String orientation) {
  return Card(
    elevation: 5, 
    // Define la elevación para dar efecto de sombra a la tarjeta.
    child: Padding(
      padding: const EdgeInsets.all(8.0), 
      // Rellena el contenido de la tarjeta con 8 píxeles de espacio alrededor.
      child: Column(
        children: [
          Icon(Icons.rotate_right, color: Colors.orange, size: 20), 
          // Ícono de rotación con color naranja y tamaño 20.
          SizedBox(height: 5, width: 5), 
          // Añade un espaciador de 5 píxeles.
          Text('Orientation', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), 
          // Texto con el título "Orientation", en negrita y tamaño 16.
          SizedBox(height: 5, width: 5), 
          // Espaciador adicional de 5 píxeles.
          Text(orientation, style: TextStyle(fontSize: 14)), 
          // Muestra el texto de orientación recibido como argumento con tamaño 14.
        ],
      ),
    ),
  );
}

// Widget que construye controles para manejar velocidades lineales y angulares.
Widget buildVelocityControls(
  double linearVelocityX, 
  double angularVelocityZ, 
  Function(double) onLinearChanged, 
  Function(double) onAngularChanged) {
  return Card(
    elevation: 5, 
    // Tarjeta con sombra para destacar los controles.
    child: Padding(
      padding: const EdgeInsets.all(8.0), 
      // Añade relleno alrededor del contenido de la tarjeta.
      child: Column(
        children: [
          SizedBox(height: 5, width: 5), 
          // Espaciador de 5 píxeles antes de los controles.
          buildSlider('Lineal Velocity ', linearVelocityX, onLinearChanged), 
          // Control deslizante para ajustar la velocidad lineal.
          buildSlider('Angular Velocity', angularVelocityZ, onAngularChanged), 
          // Control deslizante para ajustar la velocidad angular.
        ],
      ),
    ),
  );
}

// Widget genérico que construye un control deslizante.
Widget buildSlider(String label, double value, Function(double) onChanged) {
  return Column(
    children: [
      Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), 
      // Muestra el texto de etiqueta del control deslizante con negrita.
      SizedBox(
        width: 5,  
        // Ajusta el ancho del contenedor del slider.
        height: 5,  
        // Ajusta la altura del contenedor del slider.
        child: SliderTheme(
          data: SliderThemeData(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4), 
            // Cambia el tamaño del círculo deslizante a un radio de 4 píxeles.
          ),
          child: Slider(
            value: value, 
            // Establece el valor inicial del control deslizante.
            min: -2.0, 
            // Valor mínimo permitido en el control deslizante.
            max: 2.0, 
            // Valor máximo permitido en el control deslizante.
            divisions: 5, 
            // Divide el rango en 5 pasos discretos.
            onChanged: onChanged, 
            // Llama a la función pasada como argumento al cambiar el valor.
          ),
        ),
      ),
      Text(value.toStringAsFixed(2)), 
      // Muestra el valor actual del control deslizante con dos decimales.
    ],
  );
}
