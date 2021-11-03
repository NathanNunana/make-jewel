import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_jewel/models/products.dart';
import 'package:make_jewel/utils/product-card-function.dart';


// ignore: must_be_immutable
class BrowseCategories extends StatelessWidget {
  late final String? cat;
  late List<Product> prod = [];
  BrowseCategories({this.cat, required this.prod});
  @override
  Widget build(BuildContext context) {
    print(prod);
    if (prod.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(cat.toString()),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              height: 150,
              width: 150,
              child: Image.asset(
                "assets/images/empty-box.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(cat.toString()),
        ),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: prod.length,
            itemBuilder: (context, index) =>
                buildListItem(prod[index], context)),
      );
    }
  }
}
