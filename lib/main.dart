// Importa la librería de Material
import 'package:flutter/material.dart';

// Función principal, es por donde empieza a ejecutarse la app.
void main() {
  // Imprime en la consola para confirmar que la app arrancó.
  print('[main] Iniciando SaludoUAE');
  // Arranca la app mostrando el widget raíz MyApp.
  runApp(const MyApp());
} // Fin de main

// Widget raíz de la app
class MyApp extends StatelessWidget {
  // Constructor constante de la clase.
  const MyApp({super.key});

  // Indica cómo se dibuja este widget.
  @override
  Widget build(BuildContext context) {
    // Devuelve la app con estilo Material.
    return MaterialApp(
      // Título de la aplicación.
      title: 'SALUDO UAE',
      // Tema visual de la app.
      theme: ThemeData(
        // Genera los colores
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ), // Fin de ThemeData
      // Pantalla inicial, con el título que se verá en el AppBar.
      home: const MyHomePage(title: 'GRUPO 4 - 6SC'),
    ); // Fin de MaterialApp
  } // Fin de build
} // Fin de MyApp

// Pantalla principal; es Stateful porque el resultado cambia al saludar.
class MyHomePage extends StatefulWidget {
  // Constructor que exige recibir el título.
  const MyHomePage({super.key, required this.title});
  // Guarda el título que llega desde MyApp.
  final String title;

  // Crea el objeto State donde viven los datos que cambian.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
} // Fin de MyHomePage

// Clase de estado de la pantalla principal.
class _MyHomePageState extends State<MyHomePage> {
  // Controlador del TextField; permite leer lo que escribe el usuario.
  final TextEditingController _controller = TextEditingController();
  // Variable de estado de tipo String donde se guarda el mensaje a mostrar.
  String _resultado = '';

  // Metodo que se ejecuta al pulsar el botón Saludar.
  void _saludar() {
    // Lee el texto del campo y le quita los espacios de los extremos.
    String nombre = _controller.text.trim();
    // Muestra en consola el nombre leído.
    print('[_saludar] Nombre leído: "$nombre"');
    // Valida si el campo está vacío.
    if (nombre.isEmpty) {
      // Avisa en consola que el campo estaba vacío.
      print('[_saludar] Campo vacío, se avisa al usuario');
      // Redibuja la pantalla con el aviso.
      setState(() {
        // Guarda el mensaje de aviso para el usuario.
        _resultado = 'INGRESAR LOS NOMBRES COMPLETOS';
      }); // Fin de setState del aviso
      // Termina el metodo para no armar el saludo.
      return;
    } // Fin del if
    // Redibuja la pantalla con el saludo.
    setState(() {
      // Guarda el saludo con el nombre dentro de setState.
      _resultado = '¡Hola, $nombre! Bienvenido a la UAE';
      // Muestra en consola el resultado guardado.
      print('[setState] Resultado: $_resultado');
    }); // Fin de setState del saludo
  } // Fin de _saludar

  // Se ejecuta cuando la pantalla se destruye.
  @override
  void dispose() {
    // Avisa en consola que se libera el controlador.
    print('[dispose] Liberando el controlador');
    // Libera la memoria del controlador.
    _controller.dispose();
    // Termina la limpieza llamando al dispose del padre.
    super.dispose();
  } // Fin de dispose

  // Dibuja la pantalla; se repite cada vez que se llama a setState.
  @override
  Widget build(BuildContext context) {
    // Muestra en consola cada vez que se redibuja la pantalla.
    print('[build] Redibujando, resultado actual: "$_resultado"');
    // Scaffold da la estructura base: barra superior y cuerpo.
    return Scaffold(
      // Barra superior.
      appBar: AppBar(
        // Color de fondo tomado del tema.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Título de la barra, el que llegó desde MyApp.
        title: Text(widget.title),
      ), // Fin de AppBar
      // Cuerpo de la pantalla.
      body: Padding(
        // Margen interno de 16 puntos.
        padding: const EdgeInsets.all(16),
        // Column pone los widgets uno debajo del otro.
        child: Column(
          // Centra los widgets en horizontal.
          crossAxisAlignment: CrossAxisAlignment.center,
          // Lista de widgets dentro de la columna.
          children: [
            // Texto de etiqueta encima del campo.
            const Text('Ingresa tu nombre'),
            // Separador vertical de 16 puntos.
            const SizedBox(height: 16.0),
            // Campo de texto conectado al controlador.
            TextField(controller: _controller),
            // Separador vertical de 16 puntos.
            const SizedBox(height: 16.0),
            // Botón que ejecuta el saludo.
            ElevatedButton(
              // Al pulsarlo llama al metodo _saludar.
              onPressed: _saludar,
              // Texto del botón.
              child: const Text('Saludar'),
            ), // Fin de ElevatedButton
            // Separador vertical de 16 puntos.
            const SizedBox(height: 16.0),
            // Texto que muestra el resultado guardado en la variable de estado.
            Text(_resultado),
          ], // Fin de children
        ), // Fin de Column
      ), // Fin de Padding
    ); // Fin de Scaffold
  } // Fin de build
} // Fin de _MyHomePageState