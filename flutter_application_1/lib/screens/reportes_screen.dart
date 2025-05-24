import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ReportesScreen extends StatefulWidget {
  const ReportesScreen({super.key});

  @override
  State<ReportesScreen> createState() => _ReportesScreenState();
}

class _ReportesScreenState extends State<ReportesScreen> {
  String _fechaSeleccionada = "Selecciona una fecha"; // Inicializamos el texto de la fecha seleccionada

  final List<Map<String, String>> reportes = [
    {'Nombre': 'Pecera 1', 'Ingresos': '5000', 'Gastos': '2000', 'Ganancia': '3000'},
    {'Nombre': 'Pecera 2', 'Ingresos': '7000', 'Gastos': '2500', 'Ganancia': '4500'},
    // Aquí puedes agregar más datos de cada pecera
  ];

  // Función para exportar a Excel
  Future<void> exportarAExcel() async {
    var excel = Excel.createExcel(); // Crea un nuevo archivo Excel
    Sheet sheetObject = excel['Sheet1']; // Crea una hoja llamada "Sheet1"

    // Agregar los encabezados
    sheetObject.appendRow(['Nombre', 'Ingresos', 'Gastos', 'Ganancia']);

    // Agregar los datos
    reportes.forEach((reporte) {
      sheetObject.appendRow([reporte['Nombre'], reporte['Ingresos'], reporte['Gastos'], reporte['Ganancia']]);
    });

    // Obtener el directorio donde se guardará el archivo
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/reportes.xlsx');
    await file.writeAsBytes(await excel.encode()!);

    // Abrir el archivo generado
    OpenFile.open('$path/reportes.xlsx');

    // Informar al usuario que el archivo se ha guardado
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Archivo Excel exportado con éxito')));
  }

  // Función para seleccionar la fecha
  void _seleccionarFecha() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2022, 1, 1),
        maxTime: DateTime(2023, 12, 31), 
        onConfirm: (date) {
          setState(() {
            _fechaSeleccionada = "${date.year}-${date.month}-${date.day}"; // Guardar la fecha seleccionada
          });
        },
        currentTime: DateTime.now(), locale: LocaleType.es);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReportesScreen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);  // Regresar al menú principal
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menú de Reportes',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Ver Reporte'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botón para seleccionar fecha
            ElevatedButton(
              onPressed: _seleccionarFecha,
              child: Text(_fechaSeleccionada),
            ),
            const SizedBox(height: 20),
            // Contenido funcional para ReportesScreen
            Text('Contenido funcional para ReportesScreen', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            // Botón para exportar a Excel
            ElevatedButton(
              onPressed: exportarAExcel,
              child: const Text('Generar Reporte'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: exportarAExcel,  // Acción al presionar el botón para exportar los reportes
        child: const Icon(Icons.add),
      ),
    );
  }
}
