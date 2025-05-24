import 'package:flutter/material.dart';

class GananciasScreen extends StatefulWidget {
  const GananciasScreen({super.key});

  @override
  State<GananciasScreen> createState() => _GananciasScreenState();
}

class _GananciasScreenState extends State<GananciasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GananciasScreen')),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text('Contenido funcional para GananciasScreen', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
