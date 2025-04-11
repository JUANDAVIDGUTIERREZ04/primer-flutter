import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'SeleccionarCarroScreen.dart';

class MisCarrosScreen extends StatelessWidget {
  Future<List<dynamic>> obtenerCarros() async {
    final response = await http.get(
      Uri.parse('https://67f7d1812466325443eadd17.mockapi.io/carros'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar carros');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Fondo gris claro
      appBar: AppBar(
        title: Text('Mis Carros'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: obtenerCarros(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final carro = snapshot.data![index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    leading: Icon(Icons.directions_car, color: Colors.blueAccent, size: 30),
                    title: Text(
                      'Placa: ${carro["placa"]}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    subtitle: Text(
                      'Conductor: ${carro["conductor"]}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[600]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeleccionarCarroScreen(carro: carro),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(color: Colors.blueAccent),
          );
        },
      ),
    );
  }
}
