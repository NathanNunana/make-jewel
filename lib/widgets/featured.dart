import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_jewel/models/products.dart';
import 'package:make_jewel/utils/product-card-function.dart';

class FeaturedProduct extends StatelessWidget {
  late final AsyncSnapshot<List<Product>> snapshot;
  FeaturedProduct({required this.snapshot});
  @override
  Widget build(BuildContext context) {
    // var items = context.read<ProductsProvider>().products;
    return Container(
      height: 299,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var featured = snapshot.data![index].featured;
            if (featured != null && featured == true) {
              return buildListItem(snapshot.data![index], context);
            } else {
              return Container();
            }
          }),
    );
  }
}
