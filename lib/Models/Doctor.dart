import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
  Doctor({
    this.data,
  });

  List<DataDoctor> data;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    data: List<DataDoctor>.from(json["data"].map((x) => DataDoctor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataDoctor {
  DataDoctor({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.status,
  });

  int id;
  String name;
  String email;
  String mobile;
  String status;

  factory DataDoctor.fromJson(Map<String, dynamic> json) => DataDoctor(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "status": status,
  };
}
