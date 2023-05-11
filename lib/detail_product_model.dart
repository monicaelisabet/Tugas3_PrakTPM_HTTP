import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;

  DetailProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
  });

  factory DetailProductModel.fromJson(Map<String, dynamic> json) {
    return DetailProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
    );
  }

  static Future<DetailProductModel> fetch(int productId) async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products/$productId'));
    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body);
      return DetailProductModel.fromJson(jsonMap);
    } else {
      throw Exception('Failed to load product data');
    }
  }
}
