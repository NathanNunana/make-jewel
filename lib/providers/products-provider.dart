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
      products = prods
          .map((product) => Product.fromJson(product['product_data']))
          .toList();
      print("Here!");
      print(products);
      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  final List<Category> cat = [
    Category(
      title: "Beads",
      image: "assets/images/beads.png",
    ),
    Category(
      title: "NeckWear",
      image: "assets/images/jewellery.png",
    ),
    Category(
      title: "Rings",
      image: "assets/images/diamond-ring.png",
    ),
    Category(
      title: "Earings",
      image: "assets/images/earings.png",
    ),
    Category(
      title: "WristWear",
      image: "assets/images/bracelet.png",
    ),
    Category(
      title: "Anklet",
      image: "assets/images/ankle.png",
    )
  ];

  List<Product> filterProduct(String cat) {
    return products
        .where((e) =>
            e.jewelCategory.toString().toLowerCase().trim() ==
            cat.toLowerCase().trim())
        .toList();
  }

  notifyListeners();
}
