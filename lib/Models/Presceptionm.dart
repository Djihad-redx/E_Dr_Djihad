// To parse this JSON data, do
//
//     final prescreption = prescreptionFromJson(jsonString);

import 'dart:convert';

Prescreptionm prescreptionFromJson(String str) => Prescreptionm.fromJson(json.decode(str));

String prescreptionToJson(Prescreptionm data) => json.encode(data.toJson());

class Prescreptionm {
  Prescreptionm({
    this.data,
  });

  List<PrescriptionData> data;

  factory Prescreptionm.fromJson(Map<String, dynamic> json) => Prescreptionm(
    data: List<PrescriptionData>.from(json["data"].map((x) => PrescriptionData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PrescriptionData {
  PrescriptionData({
    this.id,
    this.doctor,
    this.pharmacist,
    this.patient,
    this.notes,
    this.status,
    this.products,
  });

  int id;
  String doctor;
  String pharmacist;
  String patient;
  String notes;
  String status;
  List<Product> products;

  factory PrescriptionData.fromJson(Map<String, dynamic> json) => PrescriptionData(
    id: json["id"],
    doctor: json["doctor"],
    pharmacist: json["pharmacist"],
    patient: json["patient"],
    notes: json["notes"],
    status: json["status"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor": doctor,
    "pharmacist": pharmacist,
    "patient": patient,
    "notes": notes,
    "status": status,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.id,
    this.category,
    this.branch,
    this.name,
    this.description,
    this.price,
    this.qty,
  });

  int id;
  String category;
  Branch branch;
  String name;
  String description;
  int price;
  int qty;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    category: json["category"],
    branch: branchValues.map[json["branch"]],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "branch": branchValues.reverse[branch],
    "name": name,
    "description": description,
    "price": price,
    "qty": qty,
  };
}

enum Branch { MRS_GEORGIANNA_OBERBRUNNER }

final branchValues = EnumValues({
  "Mrs. Georgianna Oberbrunner": Branch.MRS_GEORGIANNA_OBERBRUNNER
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
