// system imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// local imports
// import './widgets/scaffold.dart';
// import './widgets/appbar.dart';
import 'screens/landing_page.dart';
import 'package:make_jewel/providers/products.dart';
import 'package:make_jewel/screens/categories.dart';
import 'package:make_jewel/screens/user.dart';


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
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white
        ),
        routes: {
          "/": (_) => LandingPage(),
          "/user": (_) => UserPage(),
          "/categories":(_) => BrowseCategories()
        },
      ),
    );    
  }
}