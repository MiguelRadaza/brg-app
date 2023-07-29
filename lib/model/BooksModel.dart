// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

BooksModel booksModelFromJson(String str) =>
    BooksModel.fromJson(json.decode(str));

String booksModelToJson(BooksModel data) => json.encode(data.toJson());

class BooksModel {
  List<Book> books;

  BooksModel({
    required this.books,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
      };
}

class Book {
  int number;
  String osis;
  String human;
  int chapters;

  Book({
    required this.number,
    required this.osis,
    required this.human,
    required this.chapters,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        number: json["number"],
        osis: json["osis"],
        human: json["human"],
        chapters: json["chapters"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "osis": osis,
        "human": human,
        "chapters": chapters,
      };
}
