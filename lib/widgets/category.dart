import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_jewel/screens/categories.dart';
import 'package:provider/provider.dart';

import 'package:make_jewel/providers/products-provider.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prod = context.read<ProductsProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(15),
            child: Text(
              "Category",
              style: TextStyle(fontWeight: FontWeight.w900),
            )),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(
                  prod.cat.length,
                  (index) => Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => BrowseCategories(
                                            cat: prod.cat[index].title,
                                            prod: prod.filterProduct(prod.cat[index]
                                                .title
                                                .toString()
                                                ),
                                          )));
                            },
                            child: SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                margin: EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    prod.cat[index].image.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(prod.cat[index].title.toString())
                        ],
                      )).toList()),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(15),
            child:
                Text("Featured", style: TextStyle(fontWeight: FontWeight.w900)))
      ],
    );
  }
}
