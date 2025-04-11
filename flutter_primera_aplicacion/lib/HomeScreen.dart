import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String token;

  const HomeScreen({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('¡Bienvenido!'),
            Text('Token: $token'), // Puedes quitar esta línea luego si no la necesitas
          ],
        ),
      ),
    );
  }
}
