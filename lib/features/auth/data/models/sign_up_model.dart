

class SignUpModel {
  bool status;
  String ? message;
  Data ? data;

  SignUpModel({
    required this.status,
     this.message,
   this.data,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null
        ? Data.fromJson(json['data'])
        : null,
  );


}

class Data {
  String name;
  String phone;
  String email;
  int id;
  String image;
  String token;

  Data({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    id: json["id"],
    image: json["image"],
    token: json["token"],
  );

}
