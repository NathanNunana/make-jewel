import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stacked extends StatelessWidget {
  final String? title;
  final String? image;
  final String? description;

  Stacked({this.title, this.image, this.description});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          child: Image.network(
            image.toString(),
            fit: BoxFit.cover,
          ),
        )),
        Positioned.fill(
            child: Container(
          height: 241,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        )),
        Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    title.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * .47,
                    child: Text(description.toString(),
                        maxLines: 4,
                        style: TextStyle(color: Colors.white54, fontSize: 12)))
              ],
            )),
      ],
    );
  }
}
