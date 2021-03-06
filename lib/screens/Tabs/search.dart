// system imports
import 'package:flutter/material.dart';

// local imports
import 'package:make_jewel/models/products.dart';

class SearchProduct extends SearchDelegate {
  List<Product> product;
  SearchProduct(this.product);
  _searchLogic() {
    final suggestions = product.where((element) =>
        element.jewelName.toString().toLowerCase().contains(query.toLowerCase()));
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                  suggestions.elementAt(index).jewelUrl1.toString(),
                fit: BoxFit.cover,
              )),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(suggestions.elementAt(index).jewelName.toString()),
            Text(
              suggestions.elementAt(index).jewelDesc.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: Text("GHS " + suggestions.elementAt(index).jewelPrice.toString()),
        onTap: () {
          query = suggestions.elementAt(index).jewelName.toString();
        },
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return _searchLogic();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _searchLogic();
  }
}
