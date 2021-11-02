import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_jewel/models/products.dart';
import 'package:make_jewel/utils/product-card-function.dart';
import 'package:provider/provider.dart';

// local imports
import '../providers/products-provider.dart';

class FeaturedProduct extends StatefulWidget {
  late final Future<List<Product>>? futureProducts;
  FeaturedProduct({this.futureProducts});
  @override
  _FeaturedProductState createState() => _FeaturedProductState();
}

class _FeaturedProductState extends State<FeaturedProduct> {
  @override
  Widget build(BuildContext context) {
    // var items = context.read<ProductsProvider>().products;
    return FutureBuilder(
        future: widget.futureProducts,
        builder: (BuildContext context,AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 299,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var featured = snapshot.data![index].featured;
                    if(featured != null && featured == true){
                      return buildListItem(snapshot.data![index], context);
                    }else{
                      return Container();
                    }
                  }
                      ),
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
