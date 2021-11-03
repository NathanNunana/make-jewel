import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:make_jewel/providers/products-provider.dart';
import 'package:make_jewel/utils/product-card-function.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    var products = context.read<ProductsProvider>().products;
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          elevation: 0,
        ),
        body: SafeArea(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) =>
                    buildListItem(products[index], context))));
  }
}
