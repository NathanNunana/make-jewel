import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_jewel/providers/products-provider.dart';
import 'package:provider/provider.dart';

import 'package:make_jewel/widgets/stack.dart';

class BrowseCategories extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var cat = context.read<ProductsProvider>().products;
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height/1.5)
        ), 
        itemCount: cat.length,
        itemBuilder: (context, index)=>Container(
          width: 50,
          height: 50,
          child: Stacked(title: cat[index].jewelName, image: cat[index].jewelUrl1, description: cat[index].jewelDesc),
        )),
      ),
    );
  }
}