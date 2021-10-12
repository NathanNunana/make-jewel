import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:make_jewel/models/products.dart';
import 'package:make_jewel/utils/product-card-function.dart';
import 'package:provider/provider.dart';
import 'package:make_jewel/providers/products-provider.dart';

class Favorite extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var product = context.read<ProductsProvider>().items;
    List<Product> prod = [];
    for (var item in product) {
      if (item.saved) {
        prod.add(item);
      }
    }
    if(product.length != 0){
      return Container(
      margin: EdgeInsets.all(5),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 20,
            crossAxisSpacing: 8,
            childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height/1.4)
          ), 
          itemCount: prod.length,
          itemBuilder: (context, index) {
            return buildListItem(prod[index], context);
          }
          ),
    );
    }else{
      return SvgPicture.asset("assets/svgs/like.svg");
    }
      
  }
}
