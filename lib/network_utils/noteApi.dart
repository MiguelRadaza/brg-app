import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NotebookNetwork {
  final String BaseUrl = "https://admin.biblereadingguide.com/api/";
  final String createUrl = "notebook/create";
  final String updateUrl = "notebook/update";

  var token;
  _getToken() async {
    final _storage = FlutterSecureStorage();
    token = await _storage.read(key: 'token');
  }

  createNote(data) async {
    await _getToken();
    var fulUrl = Uri.parse(BaseUrl + createUrl);
    return await http.post(fulUrl as Uri,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getNotes() async {
    await _getToken();
    var fulUrl = Uri.parse(BaseUrl + createUrl);
    return await http.post(fulUrl as Uri, headers: _setHeaders());
  }

  updateNote(data) async {
    await _getToken();
    var fulUrl = Uri.parse(BaseUrl + createUrl);
    return await http.post(fulUrl as Uri,
        body: jsonEncode(data), headers: _setHeaders());
  }

  // SETTING HEADERS
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
