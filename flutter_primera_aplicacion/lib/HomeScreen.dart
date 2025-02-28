import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String usuario = "Juan Gutierrez";
  final List<Map<String, String>> vehiculos = [
    {"placa": "ERF888", "conductor": "David Molina", "empresa": "XYZ"},
    {"placa": "ERF999", "conductor": "Alberto Jaramillo", "empresa": "ABC"},
    {"placa": "ERF666", "conductor": "Carlos Alvarez", "empresa": "HIJ"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuario: $usuario"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: vehiculos.length,
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
                color: Colors.grey[300], 
                child: Center(child: Text("IMG")),
              ),
              title: Text("Placa: ${vehiculos[index]['placa']}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Conductor: ${vehiculos[index]['conductor']}"),
                  Text("Empresa: ${vehiculos[index]['empresa']}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
