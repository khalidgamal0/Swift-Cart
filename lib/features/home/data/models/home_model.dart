class HomeModel {
  bool status;
  dynamic message;
  Data data;

  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );


}

class Data {
  List<BannerData> banners;
  List<Product> products;
  String ad;

  Data({
    required this.banners,
    required this.products,
    required this.ad,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banners: List<BannerData>.from(json["banners"].map((x) => BannerData.fromJson(x))),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    ad: json["ad"],
  );


}

class BannerData {
  int id;
  String image;
  dynamic category;
  dynamic product;

  BannerData({
    required this.id,
    required this.image,
    required this.category,
    required this.product,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
    id: json["id"],
    image: json["image"],
    category: json["category"],
    product: json["product"],
  );


}

class Product {
  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    price: json["price"]?.toDouble(),
    oldPrice: json["old_price"]?.toDouble(),
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

}
