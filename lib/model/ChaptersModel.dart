// To parse this JSON data, do
//
//     final chaptersModel = chaptersModelFromJson(jsonString);

import 'dart:convert';

ChaptersModel chaptersModelFromJson(String str) =>
    ChaptersModel.fromJson(json.decode(str));

String chaptersModelToJson(ChaptersModel data) => json.encode(data.toJson());

class ChaptersModel {
  List<Chapter> chapters;

  ChaptersModel({
    required this.chapters,
  });

  factory ChaptersModel.fromJson(Map<String, dynamic> json) => ChaptersModel(
        chapters: List<Chapter>.from(
            json["chapters"].map((x) => Chapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
      };
}

class Chapter {
  int id;
  String referenceOsis;
  String referenceHuman;
  String content;
  String previousReferenceOsis;
  String previousReferenceHuman;
  String nextReferenceOsis;
  String nextReferenceHuman;

  Chapter({
    required this.id,
    required this.referenceOsis,
    required this.referenceHuman,
    required this.content,
    required this.previousReferenceOsis,
    required this.previousReferenceHuman,
    required this.nextReferenceOsis,
    required this.nextReferenceHuman,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        referenceOsis: json["reference_osis"],
        referenceHuman: json["reference_human"],
        content: json["content"],
        previousReferenceOsis: json["previous_reference_osis"],
        previousReferenceHuman: json["previous_reference_human"],
        nextReferenceOsis: json["next_reference_osis"],
        nextReferenceHuman: json["next_reference_human"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reference_osis": referenceOsis,
        "reference_human": referenceHuman,
        "content": content,
        "previous_reference_osis": previousReferenceOsis,
        "previous_reference_human": previousReferenceHuman,
        "next_reference_osis": nextReferenceOsis,
        "next_reference_human": nextReferenceHuman,
      };
}
