import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_jewel/utils/product-card-function.dart';
import 'package:provider/provider.dart';

// local imports
import '../providers/products-provider.dart';

class FeaturedProduct extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var items = context.read<ProductsProvider>().items;
    return Container(
      height: 299,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) =>
              buildListItem(items[index], context)),
    );
  }
}
