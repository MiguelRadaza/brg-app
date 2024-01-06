import 'package:brg/pages/accountPage.dart';
import 'package:brg/pages/loginPage.dart';
import 'package:brg/pages/notebookPage.dart';
import 'package:brg/pages/versePage.dart';
import 'package:brg/pages/versesPage.dart';
import 'package:brg/utils/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'homePage.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom_bar';

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _storage = FlutterSecureStorage();
  int _selectedIndex = 0;
  bool _isBrgNotebookEnabled = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    _checkIfLoggedIn(); // Call the login checking method on widget initialization.
    super.initState();
  }

  Future<void> _checkIfLoggedIn() async {
    var token = await _storage.read(key: 'token');
    setState(() {
      _isLoggedIn = token != null;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const VersePage(),
    const NotebookPage(),
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // If the user is not logged in, navigate to LoginPage.
    if (!_isLoggedIn) {
      return LoginPage();
    }

    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(5),
        child: GNav(
          gap: 5,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedIndex: _selectedIndex,
          color: Colors.black,
          tabBackgroundColor: Colors.grey.shade800,
          activeColor: Colors.white,
          tabs: const [
            GButton(
              textSize: 10,
              icon: Icons.home,
              iconSize: 20,
              text: "Home",
            ),
            GButton(
              textSize: 10,
              icon: Icons.menu_book,
              iconSize: 20,
              text: "Verses",
            ),
            GButton(
              textSize: 10,
              icon: Icons.description,
              iconSize: 20,
              text: "Notebook",
            ),
            GButton(
              iconSize: 20,
              textSize: 10,
              icon: Icons.person,
              text: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
