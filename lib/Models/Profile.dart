
import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.data,
    this.success,
  });

  Data data;
  bool success;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
  });

  int id;
  String name;
  String role;
  String email;
  String mobile;
  String status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    role: json["role"],
    email: json["email"],
    mobile: json["mobile"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role": role,
    "email": email,
    "mobile": mobile,
    "status": status,
  };
}
