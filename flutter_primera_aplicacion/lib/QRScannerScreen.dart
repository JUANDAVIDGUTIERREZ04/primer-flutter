import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'SeleccionarCarroScreen.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  Future<void> scanQRCode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', 'Cancelar', true, ScanMode.QR);

    if (barcodeScanRes == '-1') {
      Navigator.pop(context); // Usuario canceló
      return;
    }

    final url = 'https://67f7d1812466325443eadd17.mockapi.io/carros/$barcodeScanRes';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final carro = json.decode(response.body);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SeleccionarCarroScreen(carro: carro),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Carro no encontrado.")),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      print("Error al escanear QR: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al buscar el carro")),
      );
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    scanQRCode(); // Inicia el escaneo al entrar a la pantalla
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Escanear QR")),
      body: Center(child: Text("Escaneando QR...")),
    );
  }
}
