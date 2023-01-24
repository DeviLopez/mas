import 'dart:convert';

class DespesesModel {
  DespesesModel({
    this.id,
    required this.titol,
    this.quantitat,
  });

  int? id;
  String titol;
  String? quantitat;

  factory DespesesModel.fromJson(String str) =>
      DespesesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DespesesModel.fromMap(Map<String, dynamic> json) => DespesesModel(
        id: json["id"],
        titol: json["titol"],
        quantitat: json["quantitat"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "titol": titol,
        "quantitat": quantitat,
      };
}
