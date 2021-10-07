import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

abstract class PlatformWidget<Ios extends Widget, Android extends Widget>
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        home: createIosWidget(context),
      );
    } else {
      return MaterialApp(
        home: createAndroidWidget(context),
      );
    }
  }

  Ios createIosWidget(BuildContext context);
  Android createAndroidWidget(BuildContext context);
}
