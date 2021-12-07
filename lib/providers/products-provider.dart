import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/products.dart';

class ProductsProvider extends ChangeNotifier {
  // products added to my shop
  List<Product> _myShop = [];

  // all products
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

  // creating and uploading a product
  Future<Product> createProduct(
      String category, String title, String description, String price) async {
    var response = await http.post(
        Uri.parse(
            "https://us-central1-hive-unidash.cloudfunctions.net/api/users/makejewel/sellers/product/create/631akSUFuXchHaBjw4O3FCGm0tJ3"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader:
              'Basic eyJhbGciOiJSUzI1NiIsImtpZCI6ImY4NDY2MjEyMTQxMjQ4NzUxOWJiZjhlYWQ4ZGZiYjM3ODYwMjk5ZDciLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiQW5nbGFuaWEiLCJyb2xlIjoiYWRtaW4iLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vaGl2ZS11bmlkYXNoIiwiYXVkIjoiaGl2ZS11bmlkYXNoIiwiYXV0aF90aW1lIjoxNjE3MDY2Nzc5LCJ1c2VyX2lkIjoicHhIODBlRVZrb2h5dFBqQ1k4WmtqMGFPeHdDMyIsInN1YiI6InB4SDgwZUVWa29oeXRQakNZOFprajBhT3h3QzMiLCJpYXQiOjE2MTcwNjY3NzksImV4cCI6MTYxNzA3MDM3OSwiZW1haWwiOiJ6dXN0bW9ybmFoQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ6dXN0bW9ybmFoQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.mhz3mJ53UZ5isyUGWYs5m9WJqIQQ9mr4ymZ9-EZYnE3osdnxZ_UJFTBtmXepKhRc1EPRDibYOA8Wi25eDbZZmljlNhx8ll_brSOTS5kjazoU2-Zr5espsUIKzZMZN_UiOcQDwnHaOqB6WihEMz1JONJsvQSt6UAi9FziDvjHDahGFhWAXFHyy7N-AHIkhcLwPJ6kufHWHKddrl8Rfiyvam5sO5KdgWnAjczUm3cZ7Sbzm3FD0L7PWdBOU3Pg0CE9t8YahiX6zAo_laiSA9-yt0afy8h1S6DGW5eq9wc_rdoIrOOIfl6xIE5sxrNYKaameqpPt1W2MCIRa1l-TkZg3w',
        },
        body: jsonEncode(<String, String>{
          'jewelName': title,
          'jewelDesc': description,
          'jewelPrice': price,
          'jewelCategory': category,
          'jewelLocation': 'Ashaiman',
          'jewelRefPhone': '+233540209195',
          'featured': 'true',
        }));
    if (response.statusCode == 201) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create product");
    }
  }

  // post a product
  postProduct(String category, String title, String description, String price){
    createProduct(category, title, description, price);
    notifyListeners();
  }

  String category = "Beads";
  switchCategories(String cat){
    category = cat;
    notifyListeners(); 
  }

  // Categories
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

  // Filtering featured products
  List<Product> filterProduct(String cat) {
    return products
        .where((e) =>
            e.jewelCategory.toString().toLowerCase().trim() ==
            cat.toLowerCase().trim())
        .toList();
  }

  // notifyListeners();
}
