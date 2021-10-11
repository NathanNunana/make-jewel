import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: 213,
                child: Image.asset(
                  "assets/images/bracelets.jpg",
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(),
              ),
            ),
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter)),
            )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    "Find your Perfect Jewelry",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Just Click on SHOP NOW to see all the stunning products and order your choice of bracelet",
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff9245F5)),
                          onPressed: () {},
                          child: Text("SHOP NOW"))),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
