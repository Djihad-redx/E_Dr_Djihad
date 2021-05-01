
import 'dart:convert';

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));

String currencyToJson(Currency data) => json.encode(data.toJson());

class Currency {
  Currency({
    this.success,
    this.data,
  });

  bool success;
  List<Datum> data;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.published,
    this.rate,
    this.displayOrder,
    this.displayLocals,
    this.id,
    this.code,
    this.name,
    this.symbol,
    this.locals,
    this.createOnUtc,
    this.updateOnUtc,
    this.v,
  });

  bool published;
  double rate;
  int displayOrder;
  String displayLocals;
  String id;
  String code;
  String name;
  String symbol;
  List<dynamic> locals;
  DateTime createOnUtc;
  DateTime updateOnUtc;
  int v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    published: json["published"],
    rate: json["rate"].toDouble(),
    displayOrder: json["displayOrder"],
    displayLocals: json["displayLocals"],
    id: json["_id"],
    code: json["code"],
    name: json["name"],
    symbol: json["symbol"],
    locals: List<dynamic>.from(json["Locals"].map((x) => x)),
    createOnUtc: DateTime.parse(json["createOnUtc"]),
    updateOnUtc: DateTime.parse(json["updateOnUtc"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "published": published,
    "rate": rate,
    "displayOrder": displayOrder,
    "displayLocals": displayLocals,
    "_id": id,
    "code": code,
    "name": name,
    "symbol": symbol,
    "Locals": List<dynamic>.from(locals.map((x) => x)),
    "createOnUtc": createOnUtc.toIso8601String(),
    "updateOnUtc": updateOnUtc.toIso8601String(),
    "__v": v,
  };
}
