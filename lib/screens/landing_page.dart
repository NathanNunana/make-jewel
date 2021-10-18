import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:make_jewel/screens/Tabs/favorite.dart';
import 'package:make_jewel/screens/user.dart';
import 'package:provider/provider.dart';

// local imports
import 'package:make_jewel/screens/Tabs/home.dart';
import 'package:make_jewel/screens/Tabs/search.dart';
import 'package:make_jewel/providers/products-provider.dart';
// import '../widgets/carousel.dart';
// import '../widgets/category.dart';
// import '../widgets/featured.dart';

class LandingPage extends StatefulWidget {
  final GoogleSignInAccount? user;
  LandingPage({this.user});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late GoogleSignInAccount? user = widget.user;
  int _selectedIndex = 0;
  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
    HomeTab(),
    Favorite(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    var product = context.read<ProductsProvider>().items;
    return Scaffold(
      appBar: _selectedIndex == 2
          ? AppBar(
              elevation: 1,
              title: Text("Profile"),
            )
          : _selectedIndex == 1
              ? AppBar(
                  elevation: 1,
                  title: Text("Saved"),
                )
              : AppBar(
                  leading: Image.asset("assets/images/circular.png"),
                  // title: Text("Make Jewel"),
                  elevation: 1,
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/user");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/user.jpg"),
                        ),
                      ),
                    )
                  ],
                ),
      floatingActionButton: _selectedIndex != 0
          ? null
          : FloatingActionButton(
              backgroundColor: Theme.of(context).buttonColor,
              child: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchProduct(product),
                );
              }),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).buttonColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          // BottomNavigationBarItem(icon: Icon(Icons.home), label: "Shop")
        ],
      ),
    );
  }
}
