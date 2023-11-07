import 'package:flutter/material.dart';

class TrainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Train Your Model'),
        backgroundColor:
            Color(0xFF5e2129), // Usa el mismo color que en HomeScreen
        elevation: 0,
      ),
      body: Center(
        child: Text('Esta es la página de entrenamiento'),
      ),
    );
  }
}
