// system imports
import 'package:flutter/material.dart';

// local imports
import 'package:make_jewel/models/products.dart';

class SearchProduct extends SearchDelegate {
  List<FeaturedItem> product;
  SearchProduct(this.product);
  _searchLogic() {
    final suggestions = product.where((element) =>
        element.title.toString().toLowerCase().contains(query.toLowerCase()));
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                suggestions.elementAt(index).image.toString(),
                fit: BoxFit.cover,
              )),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(suggestions.elementAt(index).title.toString()),
            Text(
              suggestions.elementAt(index).description.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: Text("GHS " + suggestions.elementAt(index).price.toString()),
        onTap: () {
          query = suggestions.elementAt(index).title.toString();
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
