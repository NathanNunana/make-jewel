class Product {
  String? jewelName;
  String? jewelDesc;
  String? jewelUrl2;
  int? jewelPrice;
  bool saved;
  Product(
      {this.jewelName,
      this.jewelDesc,
      this.jewelUrl2,
      this.jewelPrice,
      this.saved = false});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      jewelName: json['jewelName'],
      jewelDesc: json['jewelDesc'], 
      jewelUrl2: json['jewelUrl2'],
      jewelPrice: json['jewelPrice'],
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
