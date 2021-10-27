import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/products.dart';

class ProductsProvider extends ChangeNotifier {
  final List<Product> products = [
    Product(
        jewelName: "Golden Bracelet",
        jewelDesc:
            "Nice golden bracelet for both men and women, can engrave your name on it too",
        jewelUrl2: "assets/images/bracelet.jpg",
        jewelPrice: 3000,
        ),
    Product(
        jewelName: "Golden Wristwear",
        jewelDesc:
            "Nice golden bracelet for both men and women, can engrave your name on it too",
        jewelUrl2: "assets/images/bracelets.jpg",
        jewelPrice: 5000),
    Product(
        jewelName: "Indian Bracelet",
        jewelDesc:
            "Nice golden bracelet for both men and women, can engrave your name on it too",
        jewelUrl2: "assets/images/brace.jpg",
        jewelPrice: 6000),
    Product(
        jewelName: "Golden Jewel",
        jewelDesc:
            "Nice golden bracelet for both men and women, can engrave your name on it too",
        jewelUrl2: "assets/images/user.jpg",
        jewelPrice: 2000),
  ];
  // http request
  Future<Product> fetchProduts() async{
    final response = await http.get(Uri.parse('https://us-central1-hive-unidash.cloudfunctions.net/api/users/makejewel/products'));
    if(response.statusCode == 200){
      return Product.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to fetch products');
    } 
  }
  notifyListeners();
}

class CategoryProvider extends ChangeNotifier{
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
