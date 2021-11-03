import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_jewel/models/products.dart';
import 'package:make_jewel/providers/products-provider.dart';
import 'package:make_jewel/utils/product-card-function.dart';
import 'package:provider/provider.dart';

import 'package:make_jewel/widgets/stack.dart';

// ignore: must_be_immutable
class BrowseCategories extends StatelessWidget {
  late final String? cat;
  late List<Product> prod = [];
  BrowseCategories({this.cat, required this.prod});
  @override
  Widget build(BuildContext context) {
    print(prod);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(cat.toString()),
      ),
      body: ListView.builder(
          itemCount: prod.length,
          itemBuilder: (context, index) => buildListItem(prod[index], context)),
    );
  }
}
