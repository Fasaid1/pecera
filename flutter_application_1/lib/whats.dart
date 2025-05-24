import 'package:flutter/material.dart';
import 'whatsapp.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  @override
  const MyApp ({super.key});

  @override
  Widget build (BuildContext context){
    return const MaterialApp(
      title: 'WhatsApp ',

      home: MyHomePage(),
    );
  }
}