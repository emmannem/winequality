import 'package:flutter/material.dart';
import 'package:heartdisease/screens/home_screen.dart'; // Importa tu pantalla de inicio

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WineQuality',
      theme: ThemeData(
        primaryColor: Color(0xFFE3242B),
      ),
      home: HomeScreen(), // Establece HomeScreen como la pantalla principal
    );
  }
}
