
import 'dart:convert';

Countunread countunreadFromJson(String str) => Countunread.fromJson(json.decode(str));

String countunreadToJson(Countunread data) => json.encode(data.toJson());

class Countunread {
  Countunread({
    this.data,
    this.success,
  });

  Dataunread data;
  bool success;

  factory Countunread.fromJson(Map<String, dynamic> json) => Countunread(
    data: Dataunread.fromJson(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
  };
}

class Dataunread {
  Dataunread({
    this.count,
  });

  int count;

  factory Dataunread.fromJson(Map<String, dynamic> json) => Dataunread(
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
  };
}
