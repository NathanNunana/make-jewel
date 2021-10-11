// system imports
import 'package:flutter/cupertino.dart';

// local imports
import 'package:make_jewel/widgets/carousel.dart';
import 'package:make_jewel/widgets/category.dart';
import 'package:make_jewel/widgets/featured.dart';

class HomeTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Carousel(), Categories(), FeaturedProduct()],
              ),
            ),
          ));
  }
}