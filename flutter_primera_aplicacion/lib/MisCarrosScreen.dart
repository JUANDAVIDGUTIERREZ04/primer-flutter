import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MisCarrosScreen extends StatelessWidget {
  Future<List<dynamic>> obtenerCarros() async {
    final response = await http.get(Uri.parse('https://67f7d1812466325443eadd17.mockapi.io/carros'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar carros');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mis Carros')),
      body: FutureBuilder<List<dynamic>>(
        future: obtenerCarros(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.map((carro) {
                return ListTile(
                  leading: Icon(Icons.directions_car),
                  title: Text('Placa: ${carro["placa"]}'),
                  subtitle: Text('Conductor: ${carro["conductor"]}'),
                );
              }).toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
