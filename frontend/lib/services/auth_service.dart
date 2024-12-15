import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  static const String _baseUrl = 'http://localhost/Coding/SkillHub/backend';

  Future<User?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/users'),
      body: jsonEncode({
        'action': 'login',
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['token'] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['token']);
        return User.fromJson(data);
      }
    }

    return null;
  }
}
