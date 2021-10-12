import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/products.dart';

class ProductsProvider extends ChangeNotifier {
  final List<Product> items = [
    Product(
        title: "Golden Bracelet",
        description:
            "Nice golden bracelet for both men and women, can engrave your name on it too",
        image: "assets/images/bracelet.jpg",
        price: 3000,
        ),
    Product(
        title: "Golden Wristwear",
        description:
            "Nice golden bracelet for both men and women, can engrave your name on it too",
        image: "assets/images/bracelets.jpg",
        price: 5000),
    Product(
        title: "Indian Bracelet",
        description:
            "Nice golden bracelet for both men and women, can engrave your name on it too",
        image: "assets/images/brace.jpg",
        price: 6000),
    Product(
        title: "Golden Jewel",
        description:
            "Nice golden bracelet for both men and women, can engrave your name on it too",
        image: "assets/images/user.jpg",
        price: 2000),
  ];
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
