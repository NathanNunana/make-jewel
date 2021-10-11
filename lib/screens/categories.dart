import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_jewel/providers/products.dart';
import 'package:provider/provider.dart';

import 'package:make_jewel/widgets/stack.dart';

class BrowseCategories extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var cat = context.read<CategoryProvider>().cat;
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL CATEGORIES"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height/2)
        ), 
        itemCount: cat.length,
        itemBuilder: (context, index)=>Container(
          width: 50,
          height: 50,
          color: Colors.red,
          child: Stacked(title: cat[index].title, image: cat[index].image, description: cat[index].description),
        )),
      ),
    );
  }
}