import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String BaseUrl = "https://admin.biblereadingguide.com/api/";
  final String loginUrl = "auth/login";
  final String logoutUrl = "auth/logout";

  var token;
  _getToken() async {
    final _storage = FlutterSecureStorage();
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = await _storage.read(key: 'token');
    // token = localStorage.getString("token");
    // token = jsonDecode(token)["token"];
  }

  authData(data) async {
    var fullUrl = Uri.parse(BaseUrl + loginUrl);
    return await http.post(fullUrl as Uri,
        body: jsonEncode(data), headers: _setHeaders());
  }

  logout(data) async {
    var fullUrl = Uri.parse(BaseUrl + logoutUrl);
    await _getToken();
    return await http.post(fullUrl as Uri,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = Uri.parse(BaseUrl + apiUrl);
    await _getToken();
    return await http.get(fullUrl as Uri, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
