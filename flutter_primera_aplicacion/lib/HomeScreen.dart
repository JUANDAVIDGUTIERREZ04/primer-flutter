import 'package:flutter/material.dart';
import 'MisCarrosScreen.dart';
import 'QRScannerScreen.dart';

class HomeScreen extends StatelessWidget {
  final String token;

  const HomeScreen({Key? key, required this.token}) : super(key: key);

  void _navegarAMisCarros(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MisCarrosScreen()),
    );
  }

  void _escaneoQR(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRScannerScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Inicio',
          style: TextStyle(color: Colors.amber), // Dorado
        ),
        iconTheme: IconThemeData(color: Colors.teal), // Azulejo
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido!',
              style: TextStyle(
                fontSize: 28,
                color: Colors.amber, // Dorado
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => _escaneoQR(context),
              icon: Icon(Icons.qr_code_scanner, color: Colors.teal), // Azulejo
              label: Text(
                "Escanear QR para seleccionar carro",
                style: TextStyle(color: Colors.amber), // Dorado
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[850], // Gris oscuro
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _navegarAMisCarros(context),
              icon: Icon(Icons.directions_car, color: Colors.teal), // Azulejo
              label: Text(
                "Ver lista de carros disponibles",
                style: TextStyle(color: Colors.amber), // Dorado
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[850], // Gris oscuro
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
