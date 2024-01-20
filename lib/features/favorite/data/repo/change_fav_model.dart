class ChangeFavoriteModel {
  final bool? status;
  final String? message;
  final Data? data;

  ChangeFavoriteModel({
    this.status,
    this.message,
    this.data,
  });

  factory ChangeFavoriteModel.fromJson(Map<String, dynamic> json) =>
      ChangeFavoriteModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  final int? id;
  final Product? product;

  Data({
    this.id,
    this.product,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

}

class Product {
  final int? id;
  final int? price;
  final int? oldPrice;
  final int? discount;
  final String? image;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
      );
}
