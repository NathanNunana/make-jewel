import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:make_jewel/providers/products-provider.dart';


import './stack.dart';


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var product = context.read<ProductsProvider>().products;
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 241,
              width: size.width * .47,
              child: Stacked(
                title: "Neck Wear",
                image: product[1].jewelUrl1,
              ),
            ),
            Container(
              height: 241,
              width: size.width * .47,
              child: Stacked(
                title: "Ring",
                image: product[2].jewelUrl1,
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/categories");
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text("BROWSE ALL CATEGORIES"),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
