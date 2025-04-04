import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _loginUrl =
      'https://carros-electricos.wiremockapi.cloud/auth';

  // Método para autenticar al usuario y obtener el token
  Future<String?> login(String username, String password) async {
    try {
      var response = await http.post(
        Uri.parse(_loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Si la autenticación es exitosa, devuelve el token
        var data = json.decode(response.body);
        return data['token']; // Se asume que el token viene con esta clave
      } else {
        return null; // En caso de error, no devuelve token
      }
    } catch (e) {
      print("Error al autenticar: $e");
      return null;
    }
  }
}
