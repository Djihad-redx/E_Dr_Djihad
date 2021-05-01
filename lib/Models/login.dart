
import 'dart:convert';

LoginM loginFromJson(String str) => LoginM.fromJson(json.decode(str));

String loginToJson(LoginM data) => json.encode(data.toJson());

class LoginM {
  LoginM({
    this.data,
    this.success,
  });

  Data data;
  bool success;

  factory LoginM.fromJson(Map<String, dynamic> json) => LoginM(
    data: Data.fromJson(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.role,
    this.email,
    this.mobile,
    this.status,
    this.token,
  });

  int id;
  String name;
  String role;
  String email;
  String mobile;
  String status;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    role: json["role"],
    email: json["email"],
    mobile: json["mobile"],
    status: json["status"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role": role,
    "email": email,
    "mobile": mobile,
    "status": status,
    "token": token,
  };
}
