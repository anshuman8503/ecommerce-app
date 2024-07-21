import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> fetchProducts({int limit = 10, int page = 1}) async {
    final response = await http.get(Uri.parse('$baseUrl?limit=$limit&page=$page'));
    if (response.statusCode == 200) {
      final List<dynamic> productList = json.decode(response.body);
      return productList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> searchProducts(String query) async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> productList = json.decode(response.body);
      return productList
          .map((json) => Product.fromJson(json))
          .where((product) => product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      throw Exception('Failed to search products');
    }
  }
}