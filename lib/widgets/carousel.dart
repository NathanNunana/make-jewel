import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_jewel/providers/products-provider.dart';
import 'package:provider/provider.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int imgnum = 0;
  @override
  Widget build(BuildContext context) {
    var product = context.read<ProductsProvider>().products;
    Future.delayed(
        Duration(seconds: 60),
        () => {
              setState(() {
                imgnum = (imgnum + 1) % product.length;
              })
            });

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
                child: Image.network(
                  product[imgnum].jewelUrl1,
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
                              primary: Theme.of(context).buttonColor),
                          onPressed: () {
                            Navigator.pushNamed(context, "/all-products");
                          },
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
