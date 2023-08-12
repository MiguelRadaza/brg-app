import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

final List<String> monthNames = [
  'january',
  'february',
  'march',
  'april',
  'may',
  'june',
  'july',
  'august',
  'september',
  'october',
  'november',
  'december'
];

Future<void> copyDatabase() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, "niv2011.sqlite3");

  // Only copy the database if it doesn't exist yet
  if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
    ByteData data = await rootBundle.load("assets/db/niv2011.sqlite3");
    List<int> bytes = data.buffer.asUint8List();
    await File(path).writeAsBytes(bytes);
  }
}

Future<Database> openExistingDatabase() async {
  await copyDatabase();
  Database database =
      await openDatabase(join(await getDatabasesPath(), "niv2011.sqlite3"));
  return database;
}

Future<List<Map<String, dynamic>>> fetchData() async {
  Database database = await openExistingDatabase();
  List<Map<String, dynamic>> results =
      await database.rawQuery("SELECT * FROM annotations");
  // Process the results as needed
  for (Map<String, dynamic> row in results) {
    // int id = row['id'];
    // String name = row['name'];
    // int age = row['age'];

    // Perform your desired operations with the data
    print(row);
  }
  return results;
}

Future<List<Map<String, dynamic>>> fetVerses(month, day) async {
  Database database = await openExistingDatabase();
  List<Map<String, dynamic>> results =
      await database.rawQuery("SELECT * FROM " + month);
  // Process the results as needed
  for (Map<String, dynamic> row in results) {
    // int id = row['id'];
    // String name = row['name'];
    // int age = row['age'];

    // Perform your desired operations with the data
    print(row);
  }
  return results;
}
