class AddressModel {
  final bool? status;
  final dynamic message;
  final Data? data;

  AddressModel({
    this.status,
    this.message,
    this.data,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final List<AddressDatum>? data;
  final int? total;

  Data({
    this.data,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"] == null ? [] : List<AddressDatum>.from(json["data"]!.map((x) => AddressDatum.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "total": total,
  };
}

class AddressDatum {
  final int? id;
  final String? name;
  final String? city;
  final String? region;
  final String? details;
  final String? notes;
  final double? latitude;
  final double? longitude;

  AddressDatum({
    this.id,
    this.name,
    this.city,
    this.region,
    this.details,
    this.notes,
    this.latitude,
    this.longitude,
  });

  factory AddressDatum.fromJson(Map<String, dynamic> json) => AddressDatum(
    id: json["id"],
    name: json["name"],
    city: json["city"],
    region: json["region"],
    details: json["details"],
    notes: json["notes"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "city": city,
    "region": region,
    "details": details,
    "notes": notes,
    "latitude": latitude,
    "longitude": longitude,
  };
}
