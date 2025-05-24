import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ControlParametrosScreen extends StatefulWidget {
  const ControlParametrosScreen({super.key});

  @override
  State<ControlParametrosScreen> createState() => _ControlParametrosScreenState();
}

class _ControlParametrosScreenState extends State<ControlParametrosScreen> {
  final TextEditingController _temperaturaController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _oxigenoController = TextEditingController();
  final TextEditingController _nitratosController = TextEditingController();
  final TextEditingController _nitritosController = TextEditingController();
  final TextEditingController _amoniacoController = TextEditingController();
  final TextEditingController _densidadPecesController = TextEditingController();
  final TextEditingController _nivelAguaController = TextEditingController();

  @override
  void dispose() {
    _temperaturaController.dispose();
    _phController.dispose();
    _oxigenoController.dispose();
    _nitratosController.dispose();
    _nitritosController.dispose();
    _amoniacoController.dispose();
    _densidadPecesController.dispose();
    _nivelAguaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usando un fondo con el color de la temática
      backgroundColor: const Color(0xFF00B2B2),  // Fondo verde/azul claro
      appBar: AppBar(
        title: const Text('Control de Parámetros de Pecera'),
        backgroundColor: const Color(0xFF008C8C),  // Color más oscuro para la barra
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Campos de texto para los parámetros
            _buildTextField(_temperaturaController, 'Temperatura (°C)', 'Ingrese la temperatura'),
            _buildTextField(_phController, 'pH', 'Ingrese el pH del agua'),
            _buildTextField(_oxigenoController, 'Oxígeno disuelto (mg/L)', 'Ingrese el nivel de oxígeno'),
            _buildTextField(_nitratosController, 'Nitratos (mg/L)', 'Ingrese el nivel de nitratos'),
            _buildTextField(_nitritosController, 'Nitritos (mg/L)', 'Ingrese el nivel de nitritos'),
            _buildTextField(_amoniacoController, 'Amoníaco (mg/L)', 'Ingrese el nivel de amoníaco'),
            _buildTextField(_densidadPecesController, 'Densidad de peces (peces/m²)', 'Ingrese la densidad de peces'),
            _buildTextField(_nivelAguaController, 'Nivel de agua (cm)', 'Ingrese el nivel de agua'),
            const SizedBox(height: 20),

            // Botón para guardar los parámetros
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar el código para guardar o usar los valores ingresados
                String temperatura = _temperaturaController.text;
                String ph = _phController.text;
                String oxigeno = _oxigenoController.text;
                String nitratos = _nitratosController.text;
                String nitritos = _nitritosController.text;
                String amoniaco = _amoniacoController.text;
                String densidadPeces = _densidadPecesController.text;
                String nivelAgua = _nivelAguaController.text;

                // Solo se imprimen los datos, pero puedes agregar cualquier acción con estos
                if (kDebugMode) {
                  print("Temperatura: $temperatura, pH: $ph, Oxígeno: $oxigeno, Nitratos: $nitratos, Nitritos: $nitritos, Amoníaco: $amoniaco, Densidad de Peces: $densidadPeces, Nivel de Agua: $nivelAgua");
                }

                // Limpiar los campos después de guardar
                _temperaturaController.clear();
                _phController.clear();
                _oxigenoController.clear();
                _nitratosController.clear();
                _nitritosController.clear();
                _amoniacoController.clear();
                _densidadPecesController.clear();
                _nivelAguaController.clear();
              },
              child: const Text('Guardar Parámetros'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF008C8C), // Color del botón
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
          border: const OutlineInputBorder(),
          filled: true,
          // ignore: deprecated_member_use
          fillColor: Colors.white.withOpacity(0.8),  // Fondo blanco con transparencia
        ),
      ),
    );
  }
}
