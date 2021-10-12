class Product{
  String? title;
  String? description;
  String? image;
  int? price;
  bool saved;
  Product({this.title, this.description, this.image, this.price, this.saved = false});
}

class Category{
  String? title;
  String? description;
  String? image;
  Category({this.title, this.description, this.image});
}