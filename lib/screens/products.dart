import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:make_jewel/widgets/stack.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          elevation: 0,
        ),
        body: SafeArea(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          
                          height: size.height / 4,
                          child: Stacked(
                            title: products[index].jewelName,
                            image: products[index].jewelUrl1,
                            description: products[index].jewelDesc,
                          ),
                        ),
                        SizedBox(height:10)
                      ],
                    ))));
  }
}
