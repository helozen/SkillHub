import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/service.dart';

class ServiceService {
  static const String _baseUrl = 'http://localhost/Coding/SkillHub/backend';

  Future<List<Service>> fetchServices() async {
    final response = await http.get(Uri.parse('$_baseUrl/services'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Service.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }
}
