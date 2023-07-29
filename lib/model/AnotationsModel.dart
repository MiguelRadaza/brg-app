// To parse this JSON data, do
//
//     final anotationsModel = anotationsModelFromJson(jsonString);

import 'dart:convert';

AnotationsModel anotationsModelFromJson(String str) =>
    AnotationsModel.fromJson(json.decode(str));

String anotationsModelToJson(AnotationsModel data) =>
    json.encode(data.toJson());

class AnotationsModel {
  List<Annotation> annotations;

  AnotationsModel({
    required this.annotations,
  });

  factory AnotationsModel.fromJson(Map<String, dynamic> json) =>
      AnotationsModel(
        annotations: List<Annotation>.from(
            json["annotations"].map((x) => Annotation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "annotations": List<dynamic>.from(annotations.map((x) => x.toJson())),
      };
}

class Annotation {
  int id;
  String osis;
  String link;
  String content;

  Annotation({
    required this.id,
    required this.osis,
    required this.link,
    required this.content,
  });

  factory Annotation.fromJson(Map<String, dynamic> json) => Annotation(
        id: json["id"],
        osis: json["osis"],
        link: json["link"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "osis": osis,
        "link": link,
        "content": content,
      };
}
