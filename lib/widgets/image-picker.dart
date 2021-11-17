import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImagePicker extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(8),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Center(child: Icon(CupertinoIcons.add),),
    );
  }
}