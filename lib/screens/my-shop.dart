import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyShop extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        title: Text("My Shop"),
      ),
      body: Center(child: Text("All products I add to store appears here"),),
    );
  }
}