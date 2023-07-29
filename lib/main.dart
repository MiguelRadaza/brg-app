import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:brg/pages/bottomBar.dart';
import 'package:brg/pages/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = FlutterSecureStorage();
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    String? token = await storage.read(key: 'token');
    setState(() {
      _isLoggedIn = token != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget initialRouteWidget;
    if (_isLoggedIn) {
      initialRouteWidget = BottomBar();
    } else {
      initialRouteWidget = LoginPage();
    }

    return MaterialApp(
      title: 'Bible Reading Guide',
      home:
          initialRouteWidget, // Use the appropriate widget as the initial route
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        BottomBar.routeName: (context) => BottomBar(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
