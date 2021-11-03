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
    // Favorite(),
    // Favorite(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    var product = context.read<ProductsProvider>().products;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: _selectedIndex == 2
          ? AppBar(
              elevation: 0.5,
              title: Text("Cart"),
            )
          : _selectedIndex == 1
              ? AppBar(
                  elevation: 0.5,
                  title: Text("Profile"),
                )
              : _selectedIndex == 3
                  ? AppBar(
                      elevation: 0.5,
                      title: Text("Profile"),
                    )
                  : AppBar(
                      leading: Image.asset("assets/images/circular.png"),
                      title: Text("MakeJewel",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20)),
                      elevation: 0.5,
                      actions: [
                        IconButton(
                            onPressed: () {
                              showSearch(
                                  context: context,
                                  delegate: SearchProduct(product));
                            },
                            icon: Icon(
                              CupertinoIcons.search,
                              color: Colors.black,
                            ))
                      ],
                    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff9245F5),
              child: Icon(Icons.add),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchProduct(product),
                );
              }),
      body: pages.elementAt(_selectedIndex),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color(0xff9245F5),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            // BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
            // BottomNavigationBarItem(
                // icon: Icon(Icons.shopping_bag), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            // BottomNavigationBarItem(icon: Icon(Icons.home), label: "Shop")
          ],
        ),
      ),
    );
  }
}
