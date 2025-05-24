import 'package:flutter/material.dart';

class CrearPeceraScreen extends StatefulWidget {
  const CrearPeceraScreen({super.key});

  @override
  State<CrearPeceraScreen> createState() => _CrearPeceraScreenState();
}

class _CrearPeceraScreenState extends State<CrearPeceraScreen> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _cantidadPecesController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _oxigenoController = TextEditingController();
  final TextEditingController _nivelAguaController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _cantidadPecesController.dispose();
    _phController.dispose();
    _oxigenoController.dispose();
    _nivelAguaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00B2B2), // Fondo amigable con la temática
      appBar: AppBar(
        title: const Text('Crear Pecera'),
        backgroundColor: const Color(0xFF008C8C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Campo para el nombre de la pecera
            _buildTextField(_nombreController, 'Nombre de la pecera', 'Ingrese el nombre de la pecera'),
            // Campo para la cantidad de peces
            _buildTextField(_cantidadPecesController, 'Cantidad de peces', 'Ingrese la cantidad de peces'),
            // Campo para el pH
            _buildTextField(_phController, 'pH', 'Ingrese el pH de la pecera'),
            // Campo para el oxígeno disuelto
            _buildTextField(_oxigenoController, 'Oxígeno disuelto (mg/L)', 'Ingrese el nivel de oxígeno disuelto'),
            // Campo para el nivel de agua
            _buildTextField(_nivelAguaController, 'Nivel de agua (cm)', 'Ingrese el nivel del agua'),
            const SizedBox(height: 20),

            // Botón para guardar los datos de la pecera
            ElevatedButton(
              onPressed: () {
                String nombre = _nombreController.text;
                String cantidadPeces = _cantidadPecesController.text;
                String ph = _phController.text;
                String oxigeno = _oxigenoController.text;
                String nivelAgua = _nivelAguaController.text;

                // Aquí puedes agregar la lógica para guardar estos datos o realizar alguna acción
                print("Pecera: $nombre, Cantidad de Peces: $cantidadPeces, pH: $ph, Oxígeno: $oxigeno, Nivel de Agua: $nivelAgua");

                // Limpiar los campos después de guardar
                _nombreController.clear();
                _cantidadPecesController.clear();
                _phController.clear();
                _oxigenoController.clear();
                _nivelAguaController.clear();
              },
              child: const Text('Guardar Pecera'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF008C8C),
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para crear los campos de texto reutilizables
  Widget _buildTextField(TextEditingController controller, String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
        ),
      ),
    );
  }
}
