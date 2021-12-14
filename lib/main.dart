// system imports
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:make_jewel/providers/user-provider.dart';
import 'package:make_jewel/screens/about.dart';
import 'package:make_jewel/screens/add-product.dart';
import 'package:make_jewel/screens/my-shop.dart';
import 'package:make_jewel/screens/otp.dart';
import 'package:make_jewel/screens/products.dart';
import 'package:make_jewel/screens/sign-in.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

// local imports
// import './widgets/scaffold.dart';
// import './widgets/appbar.dart';
import 'screens/landing_page.dart';
import 'package:make_jewel/providers/products-provider.dart';
import 'package:make_jewel/screens/categories.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.instance;
  await firebaseAppCheck.activate(
    webRecaptchaSiteKey: 'AIzaSyBhI4bwNvu98xRw-1daoANtypvHLHDhQHk',
  );
  runApp(MyApp());
}

// root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            // brightness: Brightness.dark,
            fontFamily: "Gotham",
            // scaffoldBackgroundColor: Colors.white,
            buttonTheme: ButtonThemeData(
                minWidth: double.infinity, buttonColor: Color(0xff9245F5)),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              // color: Colors.black
              centerTitle: true,
              titleTextStyle: TextStyle(color: Colors.black),
              iconTheme: IconThemeData(color: Colors.black),
            )),
        routes: {
          "/": (_) => 
          // OtpScreen(),
          SignInPage(),
          "/about-app": (_) => AboutAppPage(),
          "/landing": (_) => LandingPage(),
          "/all-products": (_) => ProductsPage(),
          "/add-products": (_) => AddProducts(),
          "/my-shop": (_) => MyShop(),
          // "/otpscreen": (_) => OtpScreen()
        },
      ),
    );
  }
}
