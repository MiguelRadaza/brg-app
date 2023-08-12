import 'package:brg/utils/appColor.dart';
import 'package:flutter/foundation.dart';
import 'package:brg/widgets/bigText.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../utils/fetchVerses.dart';

class Accordion extends StatefulWidget {
  final String day;
  final bool isOpen;
  final Map verses;

  const Accordion(
      {Key? key, required this.day, required this.isOpen, required this.verses})
      : super(key: key);
  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  // Show or hide the content
  late bool _isExpanded;
  String eveningVerses = "";
  late String morningBookName = '';
  late String eveningBookName = '';
  String morningVerse = '';

  Future<void> fetchBook(verses) async {
    String mBook = verses['morning_book'];
    String eBook = verses['evening_book'];

    Database database = await openExistingDatabase();
    List<Map<String, dynamic>> morningBook =
        await database.rawQuery("SELECT * FROM books WHERE osis = '$mBook'");

    List<Map<String, dynamic>> eveningBook =
        await database.rawQuery("SELECT * FROM books WHERE osis = '$eBook'");

    setState(() {
      morningBookName = morningBook.first['human'];
      eveningBookName = eveningBook.first['human'];
      eveningVerses = verses['evening_verse'];
      morningVerse = verses['morning_verse'];
      // _data_evening = evening;
      // _data = morning;
    });
  }

  @override
  void initState() {
    super.initState();
    _isExpanded =
        widget.isOpen; // Initialize _isExpanded from the widget parameter
    fetchBook(widget.verses);
  }

  @override
  Widget build(BuildContext context) {
    bool _showContent = widget.isOpen;
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        // The title
        Padding(
          padding: EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Center(
                  child: BigText(text: widget.day),
                ),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
              ),
              IconButton(
                icon: Icon(
                    _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                onPressed: () {
                  setState(() {
                    print(_isExpanded);
                    _isExpanded = !_isExpanded;
                    // _showContentNotifier.value = !_showContentNotifier.value;
                  });
                },
              ),
            ],
          ),
        ),
        // Show or hide the content based on the state
        _isExpanded
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: "Morning",
                              size: 23,
                              color: Colors.amber,
                            ),
                            Text(
                              morningBookName + " " + morningVerse.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 24),
                            )
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          child: Center(
                            child: BigText(text: "View"),
                          ),
                          decoration: BoxDecoration(
                              color: AppColors.ashGrey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: "Evening",
                              size: 23,
                              color: AppColors.prussianBlue,
                            ),
                            Text(
                              eveningBookName + " " + eveningVerses.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 24),
                            )
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          child: Center(
                            child: BigText(text: "Start"),
                          ),
                          decoration: BoxDecoration(
                              color: AppColors.lightOrange,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Container()
      ]),
    );
  }
}
