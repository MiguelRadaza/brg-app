import 'package:brg/pages/accountPage.dart';
import 'package:brg/pages/notebookPage.dart';
import 'package:brg/pages/versePage.dart';
import 'package:brg/utils/appColor.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'homePage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  bool _isBrgNotebookEnabled = true;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const VersePage(),
    const NotebookPage(),
    const AccountPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                ])));
    // return Scaffold(
    //   body: _widgetOptions[_selectedIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //       onTap: (index) => (setState(() {
    //             _selectedIndex = index;
    //           })),
    //       fixedColor: Colors.black,
    //       items: [
    //         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    //         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    //         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    //         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    //       ]),
    // );
  }
}
