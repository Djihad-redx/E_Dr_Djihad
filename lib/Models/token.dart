// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    this.success,
    this.token,
    this.data,
  });

  bool success;
  String token;
  Data data;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    success: json["success"],
    token: json["token"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "token": token,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.name,
    this.lastName,
    this.id,
    this.email,
    this.phone,
    this.token,
  });

  String name;
  String lastName;
  String id;
  String email;
  String phone;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    lastName: json["lastName"],
    id: json["id"],
    email: json["email"],
    phone: json["phone"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lastName": lastName,
    "id": id,
    "email": email,
    "phone": phone,
    "token": token,
  };
}
