
class CategoryProductsModel {
  bool status;
  dynamic message;
  Data data;

  CategoryProductsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) => CategoryProductsModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );


}

class Data {
  int currentPage;
  List<CategoryProductsDatum> data;


  Data({
    required this.currentPage,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<CategoryProductsDatum>.from(json["data"].map((x) => CategoryProductsDatum.fromJson(x))),
  );


}

class CategoryProductsDatum {
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

  CategoryProductsDatum({
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

  factory CategoryProductsDatum.fromJson(Map<String, dynamic> json) => CategoryProductsDatum(
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
