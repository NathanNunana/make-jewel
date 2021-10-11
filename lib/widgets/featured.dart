import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local imports
import '../providers/products.dart';

class FeaturedProduct extends StatelessWidget {
  _buildListItem(var item, BuildContext context) {
    return Container(
      width: 200,
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  // height: 189,
                  width: 221,
                  child: Image.asset(
                    item.image.toString(),
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  item.title.toString(),
                  style: TextStyle(
                      color: Color(0xff691CCB), fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  item.description.toString(),
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(item.price.toString(),
                    style: TextStyle(
                        color: Color(0xff691CCB), fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 15,
                )
              ],
            ),
            )],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var items = context.read<ProductsProvider>().items;
    return Container(
      height: 299,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) => _buildListItem(items[index], context)),
    );
  }
}
