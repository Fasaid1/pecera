import 'package:flutter/material.dart';

class ReportesScreen extends StatefulWidget {
  const ReportesScreen({super.key});

  @override
  State<ReportesScreen> createState() => _ReportesScreenState();
}

class _ReportesScreenState extends State<ReportesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ReportesScreen')),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text('Contenido funcional para ReportesScreen', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
