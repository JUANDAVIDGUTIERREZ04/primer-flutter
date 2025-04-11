

class AuthService {
  // Método para autenticar al usuario y obtener un token simulado
  Future<String?> login(String username, String password) async {
    // Simulación de autenticación
    if (username == 'admin' && password == 'admin') {
      // Devuelve un token falso para continuar con el flujo
      return 'fake_token_123';
    } else {
      // Usuario o contraseña incorrectos
      return null;
    }
  }
}

