import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class ApiDataSource {
  static Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
