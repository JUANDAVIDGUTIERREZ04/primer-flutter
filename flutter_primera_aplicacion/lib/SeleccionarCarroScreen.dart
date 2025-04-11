import 'package:flutter/material.dart';

class SeleccionarCarroScreen extends StatelessWidget {
  final Map<String, dynamic> carro;

  const SeleccionarCarroScreen({Key? key, required this.carro}) : super(key: key);

  void _confirmarCarro(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Confirmar'),
        content: Text('¿Desea tomar el carro ${carro["placa"]}?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cerrar el diálogo
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Carro tomado exitosamente.')),
              );
              Navigator.pop(context); // Volver atrás
            },
            child: Text('Sí'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('No'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String placa = carro["placa"] ?? "Sin placa";
    final String conductor = carro["conductor"] ?? "Sin conductor";
    final String imagen = carro["imagen"] ?? "";

    return Scaffold(
      appBar: AppBar(title: Text('Confirmar Carro')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagen.isNotEmpty)
              Image.network(imagen, height: 180)
            else
              Icon(Icons.image_not_supported, size: 100),
            SizedBox(height: 20),
            Text('Placa: $placa', style: TextStyle(fontSize: 22)),
            Text('Conductor: $conductor', style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _confirmarCarro(context),
              child: Text('Tomar carro'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}
