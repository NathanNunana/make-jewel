// system imports
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
// local imports
import 'package:make_jewel/widgets/carousel.dart';
import 'package:make_jewel/widgets/category.dart';
import 'package:make_jewel/widgets/featured.dart';
import 'package:make_jewel/models/products.dart';
import 'package:make_jewel/providers/products-provider.dart';


class HomeTab extends StatefulWidget{
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<List<Product>> futureProducts;
  
  @override
  void initState() {
    super.initState();
    futureProducts = context.read<ProductsProvider>().fetchProduts();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Carousel(), Categories(), FeaturedProduct(futureProducts:futureProducts)],
            ),
          ));
  }
}