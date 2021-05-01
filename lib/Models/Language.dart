// To parse this JSON data, do
//
//     final lang = langFromJson(jsonString);

import 'dart:convert';

Lang langFromJson(String str) => Lang.fromJson(json.decode(str));

String langToJson(Lang data) => json.encode(data.toJson());

class Lang {
  Lang({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Lang.fromJson(Map<String, dynamic> json) => Lang(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.languages,
  });

  List<Language> languages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
  };
}

class Language {
  Language({
    this.languageCulture,
    this.rtlLanguage,
    this.published,
    this.defaultCurrency,
    this.displayOrder,
    this.id,
    this.name,
    this.uniqueSeoCode,
    this.locals,
    this.createOnUtc,
    this.updateOnUtc,
    this.v,
  });

  String languageCulture;
  bool rtlLanguage;
  bool published;
  List<DefaultCurrency> defaultCurrency;
  int displayOrder;
  String id;
  String name;
  String uniqueSeoCode;
  List<dynamic> locals;
  DateTime createOnUtc;
  DateTime updateOnUtc;
  int v;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    languageCulture: json["languageCulture"],
    rtlLanguage: json["RtlLanguage"],
    published: json["published"],
    defaultCurrency: List<DefaultCurrency>.from(json["defaultCurrency"].map((x) => DefaultCurrency.fromJson(x))),
    displayOrder: json["displayOrder"],
    id: json["_id"],
    name: json["name"],
    uniqueSeoCode: json["uniqueSeoCode"],
    locals: List<dynamic>.from(json["Locals"].map((x) => x)),
    createOnUtc: DateTime.parse(json["createOnUtc"]),
    updateOnUtc: DateTime.parse(json["updateOnUtc"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "languageCulture": languageCulture,
    "RtlLanguage": rtlLanguage,
    "published": published,
    "defaultCurrency": List<dynamic>.from(defaultCurrency.map((x) => x.toJson())),
    "displayOrder": displayOrder,
    "_id": id,
    "name": name,
    "uniqueSeoCode": uniqueSeoCode,
    "Locals": List<dynamic>.from(locals.map((x) => x)),
    "createOnUtc": createOnUtc.toIso8601String(),
    "updateOnUtc": updateOnUtc.toIso8601String(),
    "__v": v,
  };
}

class DefaultCurrency {
  DefaultCurrency({
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

  factory DefaultCurrency.fromJson(Map<String, dynamic> json) => DefaultCurrency(
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
