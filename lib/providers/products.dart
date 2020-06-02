import 'package:flutter/material.dart';
import './product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'slive Shirt',
      description: 'best in price in market',
      price: 29.99,
      imageUrl: 'http://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8116.png',
    ),
    Product(
      id: 'p2',
      title: 'slive Shirt',
      description: 'best in price in market',
      price: 29.99,
      imageUrl: 'http://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8116.png',
    ),
    Product(
      id: 'p3',
      title: 'slive Shirt',
      description: 'best in price in market',
      price: 29.99,
      imageUrl: 'http://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8116.png',
    ),
    Product(
      id: 'p4',
      title: 'Pant',
      description: 'best in price in market',
      price: 29.99,
      imageUrl: 'http://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8116.png',
    ),
    Product(
      id: 'p5',
      title: 'Umbrella',
      description: 'best in price in market',
      price: 29.99,
      imageUrl: 'http://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8116.png',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get fevoriteItems {
    return _items.where((prodItem) => prodItem.isFevorite).toList();
  }

  void addProduct(Product product) {
    final _newproduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );
    _items.add(_newproduct);
    notifyListeners();
  }

  void updateProduct(String id, Product product) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
