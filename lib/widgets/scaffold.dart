import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// local import
import '../platform.dart';

class PlatformScaffold extends PlatformWidget<CupertinoPageScaffold, Scaffold> {
  final Widget? appbar;
  final Widget? body;

  PlatformScaffold({this.appbar, this.body});

  @override 
  CupertinoPageScaffold createIosWidget(BuildContext context) {
    return new CupertinoPageScaffold(
      // navigationBar: appbar,
      child: Container(),
    );
  }

  @override 
  Scaffold createAndroidWidget(BuildContext context){
    return new Scaffold(
      appBar: AppBar(),
      body: body,
    );
  }
}