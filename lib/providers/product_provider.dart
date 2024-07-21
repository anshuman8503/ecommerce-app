import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  final ApiService _apiService = ApiService();

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts({int page = 1}) async {
    _isLoading = true;
    notifyListeners();
    try {
      final fetchedProducts = await _apiService.fetchProducts(limit: 10, page: page);
      if (page == 1) {
        _products = fetchedProducts;
      } else {
        _products.addAll(fetchedProducts);
      }
    } catch (error) {
      print('Error fetching products: $error');
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchProducts(String query) async {
    _isLoading = true;
    notifyListeners();
    try {
      _products = await _apiService.searchProducts(query);
    } catch (error) {
      print('Error searching products: $error');
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearSearch() {
    _products = [];
    fetchProducts();
  }

  void sortProducts(String sortBy) {
    if (sortBy == 'price') {
      _products.sort((a, b) => a.price.compareTo(b.price));
    } else if (sortBy == 'rating') {
      _products.sort((a, b) => b.rating.compareTo(a.rating));
    }
    notifyListeners();
  }

  void filterProducts({String? category, double? minPrice, double? maxPrice}) {
    _isLoading = true;
    notifyListeners();
    _products = _products.where((product) {
      final matchesCategory = category == null || product.category == category;
      final matchesMinPrice = minPrice == null || product.price >= minPrice;
      final matchesMaxPrice = maxPrice == null || product.price <= maxPrice;
      return matchesCategory && matchesMinPrice && matchesMaxPrice;
    }).toList();
    _isLoading = false;
    notifyListeners();
  }
}