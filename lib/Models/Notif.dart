// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

Notificationm notificationFromJson(String str) => Notificationm.fromJson(json.decode(str));

String notificationToJson(Notificationm data) => json.encode(data.toJson());

class Notificationm {
  Notificationm({
    this.data,
    this.success,
  });

  List<DatumNotif> data;
  bool success;

  factory Notificationm.fromJson(Map<String, dynamic> json) => Notificationm(
    data: List<DatumNotif>.from(json["data"].map((x) => DatumNotif.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
  };
}

class DatumNotif {
  DatumNotif({
    this.id,
    this.user,
    this.title,
    this.description,
    this.prescriptionId,
    this.date,
    this.isRead,
    this.readAt,
  });

  String id;
  String user;
  String title;
  String description;
  int prescriptionId;
  String date;
  bool isRead;
  String readAt;

  factory DatumNotif.fromJson(Map<String, dynamic> json) => DatumNotif(
    id: json["id"],
    user: json["user"],
    title: json["title"],
    description: json["description"],
    prescriptionId: json["prescription_id"] == null ? null : json["prescription_id"],
    date: json["date"],
    isRead: json["is_read"],
    readAt: json["read_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user,
    "title": title,
    "description": description,
    "prescription_id": prescriptionId == null ? null : prescriptionId,
    "date": date,
    "is_read": isRead,
    "read_at": readAt,
  };
}
