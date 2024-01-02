
class SearchModel {
  final bool? status;
  final Data? data;

  SearchModel({
    this.status,
    this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  final List<DatumSearch>? data;
  final int? total;

  Data({
    this.data,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"] == null ? [] : List<DatumSearch>.from(json["data"]!.map((x) => DatumSearch.fromJson(x))),
    total: json["total"],
  );

}

class DatumSearch {
  final int? id;
  final double? price;
  final String? image;
  final String? name;
  final String? description;
  final List<String>? images;
  final bool? inFavorites;
  final bool? inCart;

  DatumSearch({
    this.id,
    this.price,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  factory DatumSearch.fromJson(Map<String, dynamic> json) => DatumSearch(
    id: json["id"],
    price: json["price"]?.toDouble(),
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

}
