import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local imports
import 'package:make_jewel/screens/Tabs/home.dart';
import 'package:make_jewel/screens/Tabs/search.dart';
import 'package:make_jewel/providers/products.dart';
// import '../widgets/carousel.dart';
// import '../widgets/category.dart';
// import '../widgets/featured.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Widget> pages = [
    HomeTab(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    var product = context.read<ProductsProvider>().items;
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/circular.png"),
        title: Text("Make Jewel"),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: (){
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff9245F5),
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
        selectedItemColor: Color(0xff691CCB),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_sharp), label: "Cart"),
          // BottomNavigationBarItem(icon: Icon(Icons.home), label: "Shop")
        ],
      ),
      
    );
  }
}
