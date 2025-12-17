import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _keyEmail = 'userEmail';
  static const String _keyPassword = 'userPassword';

  // Connexion : sauvegarder email et mot de passe
  Future<void> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPassword, password);
  }

  // Vérifier si utilisateur connecté
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail) != null &&
        prefs.getString(_keyPassword) != null;
  }

  // Déconnexion
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyEmail);
    await prefs.remove(_keyPassword);
  }
}
