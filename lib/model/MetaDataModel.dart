// To parse this JSON data, do
//
//     final metaDataModel = metaDataModelFromJson(jsonString);

import 'dart:convert';

MetaDataModel metaDataModelFromJson(String str) =>
    MetaDataModel.fromJson(json.decode(str));

String metaDataModelToJson(MetaDataModel data) => json.encode(data.toJson());

class MetaDataModel {
  List<Metadatum> metadata;

  MetaDataModel({
    required this.metadata,
  });

  factory MetaDataModel.fromJson(Map<String, dynamic> json) => MetaDataModel(
        metadata: List<Metadatum>.from(
            json["metadata"].map((x) => Metadatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metadata": List<dynamic>.from(metadata.map((x) => x.toJson())),
      };
}

class Metadatum {
  int id;
  String name;
  String value;

  Metadatum({
    required this.id,
    required this.name,
    required this.value,
  });

  factory Metadatum.fromJson(Map<String, dynamic> json) => Metadatum(
        id: json["id"],
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
      };
}
