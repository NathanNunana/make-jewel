// system imports
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// local imports
import 'platform.dart';
import './widgets/scaffold.dart';
import './widgets/appbar.dart';


void main() => runApp(MyApp());

// root widget
class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return PlatformScaffold(
      appbar: PlatformAppBar(
        leading: Text("logo"),
        title: Text("Make Jewel"),
      ),
    );
  }
}