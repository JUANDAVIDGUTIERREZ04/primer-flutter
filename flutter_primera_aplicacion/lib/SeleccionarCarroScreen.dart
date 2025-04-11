import 'package:flutter/material.dart';

class SeleccionarCarroScreen extends StatelessWidget {
  final Map<String, dynamic> carro;

  SeleccionarCarroScreen({required this.carro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirmar carro')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('¿Desea tomar el carro ${carro["placa"]}?'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí iría la lógica para reservar el carro
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Carro tomado con éxito')),
                );
                Navigator.pop(context);
              },
              child: Text('Sí'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('No'),
            ),
          ],
        ),
      ),
    );
  }
}
