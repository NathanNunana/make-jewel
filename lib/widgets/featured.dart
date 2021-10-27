import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_jewel/models/products.dart';
import 'package:make_jewel/utils/product-card-function.dart';
import 'package:provider/provider.dart';

// local imports
import '../providers/products-provider.dart';

class FeaturedProduct extends StatefulWidget {
  @override
  _FeaturedProductState createState() => _FeaturedProductState();
}

class _FeaturedProductState extends State<FeaturedProduct> {
  late Future<Product> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = context.read<ProductsProvider>().fetchProduts();
  }

  @override
  Widget build(BuildContext context) {
    // var items = context.read<ProductsProvider>().products;
    return FutureBuilder(
        future: futureProducts,
        builder: (context, snapshot) {
          print("This is the : ${snapshot.data.toString().length}");
          print("This is the : ${snapshot.data}");
          if (snapshot.hasData) {
            return Container(
              height: 299,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) =>
                      buildListItem(snapshot.data, context)),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
