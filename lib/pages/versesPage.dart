import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../utils/fetchVerses.dart';
import '../widgets/Accordion.dart';
import '../widgets/bigText.dart';

class VersesPage extends StatefulWidget {
  const VersesPage({Key? key}) : super(key: key);

  @override
  _VersesPageState createState() => _VersesPageState();
}

class _VersesPageState extends State<VersesPage> {
  List<Map<String, dynamic>> _data = [];
  final double maxOffset = 100.0;
  DateTime now = DateTime.now();
  ScrollController _scrollController = ScrollController();

  Future<void> fetchVerses(month) async {
    Database database = await openExistingDatabase();
    List<Map<String, dynamic>> morning =
        await database.rawQuery("SELECT * FROM $month");

    setState(() {
      _data = morning;
    });

    scrollToOpenAccordion();
  }

  void scrollToOpenAccordion() {
    print((maxOffset + now.day));
    double scrollOffset =
        now.day * (now.day >= 20 ? (maxOffset + now.day) : maxOffset);
    _scrollController.animateTo(
      scrollOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    // }
  }

  @override
  void initState() {
    super.initState();
    int currentMonthIndex = now.month;
    String currentMonthName = monthNames[currentMonthIndex - 1];
    fetchVerses(currentMonthName);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 95),
            BigText(
              text: "August 2023", // Replace with your dynamic month
              size: 35,
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Accordion(
                      isOpen: now.day == _data[index]['id'],
                      day: _data[index]['id'].toString(),
                      verses: _data[index],
                      // content: _data[index]['content'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
