import 'package:flutter/material.dart';

class CrearPeceraScreen extends StatefulWidget {
  const CrearPeceraScreen({super.key});

  @override
  State<CrearPeceraScreen> createState() => _CrearPeceraScreenState();
}

class _CrearPeceraScreenState extends State<CrearPeceraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CrearPeceraScreen')),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text('Contenido funcional para CrearPeceraScreen', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
