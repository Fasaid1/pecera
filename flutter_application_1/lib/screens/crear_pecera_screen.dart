import 'package:flutter/material.dart';

import '../models/peceraModel.dart';
import '../services/peceraService.dart';

class CrearPeceraScreen extends StatefulWidget {
  const CrearPeceraScreen({super.key});

  @override
  State<CrearPeceraScreen> createState() => _CrearPeceraScreenState();
}

class _CrearPeceraScreenState extends State<CrearPeceraScreen> {
  final PeceraService _peceraService = PeceraService();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _cantidadPecesController =
      TextEditingController();
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
      backgroundColor: const Color(0xFFC9F0FF),
      appBar: AppBar(
        title: const Text(
          'Crear Pecera',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF009788),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    _nombreController,
                    'Nombre de la pecera',
                    'Ingrese el nombre',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    _cantidadPecesController,
                    'Cantidad de peces',
                    'Ingrese cantidad',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    _phController,
                    'pH',
                    'Ingrese el pH',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    _oxigenoController,
                    'Oxígeno disuelto (mg/L)',
                    'Ingrese O₂ disuelto',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    _nivelAguaController,
                    'Nivel de agua (cm)',
                    'Ingrese nivel de agua',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_nombreController.text.isEmpty &&
                    _cantidadPecesController.text.isEmpty &&
                    _phController.text.isEmpty &&
                    _oxigenoController.text.isEmpty &&
                    _nivelAguaController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Por favor, complete todos los campos requeridos.')),
                  );
                  return;
                }

                String nombre = _nombreController.text;
                int? cantidadPeces =
                    int.tryParse(_cantidadPecesController.text);
                double? ph = double.tryParse(_phController.text);
                double? oxigeno = double.tryParse(_oxigenoController.text);
                double? nivelAgua = double.tryParse(_nivelAguaController.text);
                DateTime fechaSiembraActual = DateTime.now();

                if (cantidadPeces == null ||
                    ph == null ||
                    oxigeno == null ||
                    nivelAgua == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Por favor, ingrese valores numéricos válidos.')),
                  );
                  return;
                }

                Pecera nuevaPecera = Pecera(
                  nombrePecera: nombre,
                  cantidadPeces: cantidadPeces,
                  cantidadPh: ph,
                  cantidadOxigenoDisuelto: oxigeno,
                  nivelAgua: nivelAgua,
                  fechaSiembra: fechaSiembraActual,
                  estado: true,
                  esDestacada: false,
                );

                try {
                  showDialog(
                      context: context,
                      builder: (_) => CircularProgressIndicator());
                  Pecera? peceraCreada =
                      await _peceraService.createPecera(nuevaPecera);
                  Navigator.pop(context);

                  if (peceraCreada != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Pecera "${peceraCreada.nombrePecera}" creada exitosamente!')),
                    );
                    _nombreController.clear();
                    _cantidadPecesController.clear();
                    _phController.clear();
                    _oxigenoController.clear();
                    _nivelAguaController.clear();
                    Navigator.pop(context, true);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Error al crear la pecera. El servicio devolvió nulo.')),
                    );
                  }
                } catch (e) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${e.toString()}')),
                  );
                  print("Error al crear pecera: $e");
                }
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

  Widget _buildTextField(
      TextEditingController controller, String label, String hint) {
    Color labelColor = Colors.black54;
    Color floatingLabelColor = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: label.toLowerCase().contains("nombre")
            ? TextInputType.text
            : TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: labelColor,
            fontWeight: FontWeight.normal,
          ),
          floatingLabelStyle: TextStyle(
            color: floatingLabelColor, // Color del label cuando está enfocado/flotando
            fontWeight: FontWeight.bold, // Opcional: hacerlo bold cuando flota
          ),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder( // Color del borde cuando está enfocado
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.9),
        ),
        // El estilo del texto ingresado por el usuario
        style: TextStyle(color: Colors.black87), // Asegúrate de que el texto ingresado también contraste
      ),
    );
  }
}
