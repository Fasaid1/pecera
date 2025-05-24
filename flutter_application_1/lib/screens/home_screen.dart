import 'package:flutter/material.dart';
import 'crear_pecera_screen.dart';
import 'control_parametros_screen.dart';
import 'gastos_screen.dart';
import 'ganancias_screen.dart';
import 'reportes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo_pecera.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Gestión de Peceras'),
          backgroundColor:const  Color.fromRGBO(0, 128, 128, 0.8),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.teal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', width: 150),
                    const SizedBox(height: 10),
                    const Text('Menú', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Crear Pecera'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CrearPeceraScreen())),
              ),
              ListTile(
                leading: const Icon(Icons.thermostat),
                title: const Text('Control de Parámetros'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ControlParametrosScreen())),
              ),
              ListTile(
                leading: const Icon(Icons.money),
                title: const Text('Gastos'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GastosScreen())),
              ),
              ListTile(
                leading: const Icon(Icons.bar_chart),
                title: const Text('Ganancias'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GananciasScreen())),
              ),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('Reportes'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReportesScreen())),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 200),
              const SizedBox(height: 20),
              const Text(
                'Bienvenido a la gestión de peceras',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
