// system imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:make_jewel/providers/user-provider.dart';
import 'package:provider/provider.dart';

// local imports
// import './widgets/scaffold.dart';
// import './widgets/appbar.dart';
import 'screens/landing_page.dart';
import 'package:make_jewel/providers/products-provider.dart';
import 'package:make_jewel/screens/categories.dart';


void main() => runApp(MyApp());

// root widget
class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_)=> CategoryProvider(),
        ), 
        ChangeNotifierProvider(
          create: (_)=>UserProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          buttonColor: Color(0xff9245F5),
          primarySwatch: Colors.blue
        ),
        routes: {
          "/": (_) => LandingPage(),
          // "/user": (_) => UserPage(),
          "/categories":(_) => BrowseCategories()
        },
      ),
    );    
  }
}