class Product {
  dynamic jewelName;
  dynamic jewelDesc;
  dynamic jewelUrl1;
  dynamic jewelUrl2;
  dynamic jewelUrl3;
  dynamic jewelPrice;
  dynamic jewelLocation;
  dynamic jewelRefPhone;
  dynamic featured;
  bool saved;
  Product(
      {required this.jewelName,
      required this.jewelDesc,
      required this.jewelUrl1,
      required this.jewelUrl2,
      required this.jewelUrl3,
      required this.jewelPrice,
      required this.jewelLocation,
      required this.jewelRefPhone,
      required this.featured,
      this.saved = false});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      jewelName: json['jewelName'],
      jewelDesc: json['jewelDesc'],
      jewelUrl1: json['jewelUrl1'], 
      jewelUrl2: json['jewelUrl2'],
      jewelUrl3: json['jewelUrl3'],
      jewelPrice: json['jewelPrice'].toString(),
      jewelLocation: json['jewelLocation'],
      jewelRefPhone: json['jewelRefPhone'],
      featured: json['featured']
    );
  }
}


class Category {
  String? title;
  String? description;
  String? image;
  Category({this.title, this.description, this.image});

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      title: json['title'],
      description: json['description'],
      image: json['image']
    );
  }
}
