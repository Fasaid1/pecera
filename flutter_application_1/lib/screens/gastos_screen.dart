import 'package:flutter/material.dart';

class GastosScreen extends StatefulWidget {
  const GastosScreen({super.key});

  @override
  State<GastosScreen> createState() => _GastosScreenState();
}

class _GastosScreenState extends State<GastosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GastosScreen')),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text('Contenido funcional para GastosScreen', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
