import 'package:flutter/material.dart';

class ControlParametrosScreen extends StatefulWidget {
  const ControlParametrosScreen({super.key});

  @override
  State<ControlParametrosScreen> createState() => _ControlParametrosScreenState();
}

class _ControlParametrosScreenState extends State<ControlParametrosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ControlParametrosScreen')),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text('Contenido funcional para ControlParametrosScreen', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
