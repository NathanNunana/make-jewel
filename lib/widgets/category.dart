import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './stack.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                image: "assets/images/neck.jpg",
              ),
            ),
            Container(
              height: 241,
              width: size.width * .47,
              child: Stacked(
                title: "Ring",
                image: "assets/images/ring.jpg",
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
