// To parse this JSON data, do
//
//     final versesModel = versesModelFromJson(jsonString);

import 'dart:convert';

VersesModel versesModelFromJson(String str) =>
    VersesModel.fromJson(json.decode(str));

String versesModelToJson(VersesModel data) => json.encode(data.toJson());

class VersesModel {
  List<Verse> verses;

  VersesModel({
    required this.verses,
  });

  factory VersesModel.fromJson(Map<String, dynamic> json) => VersesModel(
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
      };
}

class Verse {
  int id;
  Book book;
  double verse;
  String unformatted;

  Verse({
    required this.id,
    required this.book,
    required this.verse,
    required this.unformatted,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        book: bookValues.map[json["book"]]!,
        verse: json["verse"]?.toDouble(),
        unformatted: json["unformatted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "book": bookValues.reverse[book],
        "verse": verse,
        "unformatted": unformatted,
      };
}

enum Book {
  ACTS,
  AMOS,
  COL,
  DAN,
  DEUT,
  ECCL,
  EPH,
  ESTH,
  EXOD,
  EZEK,
  EZRA,
  GAL,
  GEN,
  HAB,
  HAG,
  HEB,
  HOS,
  ISA,
  JAS,
  JER,
  JOB,
  JOEL,
  JOHN,
  JONAH,
  JOSH,
  JUDE,
  JUDG,
  LAM,
  LEV,
  LUKE,
  MAL,
  MARK,
  MATT,
  MIC,
  NAH,
  NEH,
  NUM,
  OBAD,
  PHIL,
  PHLM,
  PROV,
  PS,
  REV,
  ROM,
  RUTH,
  SONG,
  THE_1_CHR,
  THE_1_COR,
  THE_1_JOHN,
  THE_1_KGS,
  THE_1_PET,
  THE_1_SAM,
  THE_1_THESS,
  THE_1_TIM,
  THE_2_CHR,
  THE_2_COR,
  THE_2_JOHN,
  THE_2_KGS,
  THE_2_PET,
  THE_2_SAM,
  THE_2_THESS,
  THE_2_TIM,
  THE_3_JOHN,
  TITUS,
  ZECH,
  ZEPH
}

final bookValues = EnumValues({
  "Acts": Book.ACTS,
  "Amos": Book.AMOS,
  "Col": Book.COL,
  "Dan": Book.DAN,
  "Deut": Book.DEUT,
  "Eccl": Book.ECCL,
  "Eph": Book.EPH,
  "Esth": Book.ESTH,
  "Exod": Book.EXOD,
  "Ezek": Book.EZEK,
  "Ezra": Book.EZRA,
  "Gal": Book.GAL,
  "Gen": Book.GEN,
  "Hab": Book.HAB,
  "Hag": Book.HAG,
  "Heb": Book.HEB,
  "Hos": Book.HOS,
  "Isa": Book.ISA,
  "Jas": Book.JAS,
  "Jer": Book.JER,
  "Job": Book.JOB,
  "Joel": Book.JOEL,
  "John": Book.JOHN,
  "Jonah": Book.JONAH,
  "Josh": Book.JOSH,
  "Jude": Book.JUDE,
  "Judg": Book.JUDG,
  "Lam": Book.LAM,
  "Lev": Book.LEV,
  "Luke": Book.LUKE,
  "Mal": Book.MAL,
  "Mark": Book.MARK,
  "Matt": Book.MATT,
  "Mic": Book.MIC,
  "Nah": Book.NAH,
  "Neh": Book.NEH,
  "Num": Book.NUM,
  "Obad": Book.OBAD,
  "Phil": Book.PHIL,
  "Phlm": Book.PHLM,
  "Prov": Book.PROV,
  "Ps": Book.PS,
  "Rev": Book.REV,
  "Rom": Book.ROM,
  "Ruth": Book.RUTH,
  "Song": Book.SONG,
  "1Chr": Book.THE_1_CHR,
  "1Cor": Book.THE_1_COR,
  "1John": Book.THE_1_JOHN,
  "1Kgs": Book.THE_1_KGS,
  "1Pet": Book.THE_1_PET,
  "1Sam": Book.THE_1_SAM,
  "1Thess": Book.THE_1_THESS,
  "1Tim": Book.THE_1_TIM,
  "2Chr": Book.THE_2_CHR,
  "2Cor": Book.THE_2_COR,
  "2John": Book.THE_2_JOHN,
  "2Kgs": Book.THE_2_KGS,
  "2Pet": Book.THE_2_PET,
  "2Sam": Book.THE_2_SAM,
  "2Thess": Book.THE_2_THESS,
  "2Tim": Book.THE_2_TIM,
  "3John": Book.THE_3_JOHN,
  "Titus": Book.TITUS,
  "Zech": Book.ZECH,
  "Zeph": Book.ZEPH
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
