import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:make_jewel/providers/products-provider.dart';
import 'package:make_jewel/utils/product-card-function.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    var products = context.read<ProductsProvider>().products;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Products"),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
              
                children: List<Widget>.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ChoiceChip(
                            avatar: Icon(Icons.receipt),
                            label: Text("Recent"),
                            selected: _value == index,
                            onSelected: (bool selected) {
                              setState(() {
                                _value = selected ? index : null;
                              });
                            },
                          ),
                    )).toList(),
              ),
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                      buildListItem(products[index], context),
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
