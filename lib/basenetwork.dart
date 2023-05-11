import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static const String baseUrl = 'https://fakestoreapi.com';

  static Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(baseUrl + url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> post(String url, dynamic body) async {
    final response = await http.post(
      Uri.parse(baseUrl + url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }

  static Future<dynamic> put(String url, dynamic body) async {
    final response = await http.put(
      Uri.parse(baseUrl + url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update data');
    }
  }

  static Future<dynamic> delete(String url) async {
    final response = await http.delete(Uri.parse(baseUrl + url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to delete data');
    }
  }
}
