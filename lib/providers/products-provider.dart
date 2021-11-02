import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/products.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> products = [];
  // http request
  Future<List<Product>> fetchProduts() async {
    final response = await http.get(Uri.parse(
        'https://us-central1-hive-unidash.cloudfunctions.net/api/users/makejewel/products'));
    if (response.statusCode == 200) {
      List<dynamic> prods = jsonDecode(response.body)['productsArray'];
      products = prods.map((product) => Product.fromJson(product['product_data'])).toList();
      print("Here!");
      print(products);
      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  notifyListeners();
}

class CategoryProvider extends ChangeNotifier {
  final List<Category> cat = [
    Category(
      title: "Rings",
      description:
          "Nice golden bracelet for both men and women, can engrave your name on it too",
      image: "assets/images/bracelet.jpg",
    ),
    Category(
      title: "Neck Wear",
      description:
          "Nice golden bracelet for both men and women, can engrave your name on it too",
      image: "assets/images/bracelets.jpg",
    ),
    Category(
      title: "Wrist Wear",
      description:
          "Nice golden bracelet for both men and women, can engrave your name on it too",
      image: "assets/images/brace.jpg",
    ),
    Category(
      title: "Beads",
      description:
          "Nice golden bracelet for both men and women, can engrave your name on it too",
      image: "assets/images/user.jpg",
    ),
    Category(
      title: "Earlings",
      description:
          "Nice golden bracelet for both men and women, can engrave your name on it too",
      image: "assets/images/user.jpg",
    ),
    Category(
      title: "Anklets",
      description:
          "Nice golden bracelet for both men and women, can engrave your name on it too",
      image: "assets/images/user.jpg",
    )
  ];
}
