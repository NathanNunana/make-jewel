// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// // local import
// import '../platform.dart';

// class PlatformAppBar extends PlatformWidget<CupertinoNavigationBar, AppBar> {
//   final Widget? leading;
//   final Widget? title;

//   PlatformAppBar({this.leading, this.title});

//   @override 
//   CupertinoNavigationBar createIosWidget(BuildContext context) {
//     return new CupertinoNavigationBar(
//       leading: leading,
//       middle: title,
//     );
//   }

//   @override 
//   AppBar createAndroidWidget(BuildContext context){
//     return new AppBar(
//       leading: leading,
//       title: title,
//     );
//   }
// }