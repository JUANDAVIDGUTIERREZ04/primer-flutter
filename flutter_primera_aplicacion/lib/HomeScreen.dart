import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  final String token;

  HomeScreen({required this.token});

  // URL para obtener el listado de vehículos
  static const String _carsUrl =
      'https://carros-electricos.wiremockapi.cloud/carros';

  // Lista de vehículos de ejemplo
  List<Map<String, String>> _exampleVehicles = [
    {'placa': 'ERF888', 'conductor': 'David Molina', 'empresa': 'XYZ'},
    {'placa': 'ERF999', 'conductor': 'Alberto Jaramillo', 'empresa': 'ABC'},
    {'placa': 'ERF666', 'conductor': 'Carlos Alvarez', 'empresa': 'HIJ'},
  ];

  // Método para obtener los vehículos (con la opción de usar datos estáticos)
  Future<List<Map<String, String>>> _fetchCars() async {
    try {
      var response = await http.get(
        Uri.parse(_carsUrl),
        headers: {'Authentication': token}, // Usamos el token en la cabecera
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        // Asumimos que la respuesta es una lista de vehículos
        return List<Map<String, String>>.from(
          data.map(
            (car) => {
              'placa': car['placa'],
              'conductor': car['conductor'],
              'empresa': car['empresa'],
            },
          ),
        );
      } else {
        // Si no hay respuesta válida, devolvemos los vehículos de ejemplo
        return _exampleVehicles;
      }
    } catch (e) {
      print("Error al obtener los vehículos: $e");
      // En caso de error, devolvemos los vehículos de ejemplo
      return _exampleVehicles;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mis Vehículos"), centerTitle: true),
      body: FutureBuilder<List<Map<String, String>>>(
        future: _fetchCars(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error al cargar los vehículos"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No tienes vehículos disponibles"));
          } else {
            var vehicles = snapshot.data!;
            return ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey[300], // Espacio para la imagen
                      child: Icon(
                        Icons.directions_car,
                        color: Colors.black,
                      ), // Ícono de auto
                    ),
                    title: Text("Placa: ${vehicles[index]['placa']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Conductor: ${vehicles[index]['conductor']}"),
                        Text("Empresa: ${vehicles[index]['empresa']}"),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
