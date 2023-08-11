import 'package:brg/model/VersesModel.dart';
import 'package:brg/pages/createNotePage.dart';
import 'package:brg/pages/notebookPage.dart';
import 'package:brg/widgets/bigText.dart';
import 'package:brg/widgets/verseText.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DevotionalPage extends StatefulWidget {
  const DevotionalPage({Key? key}) : super(key: key);

  @override
  _DevotionalPageState createState() => _DevotionalPageState();
}

class _DevotionalPageState extends State<DevotionalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Matthew 1 - July 7, 2023'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(24),
                height: 490,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Malakai 4:1",
                      size: 24,
                    ),
                    const Gap(15),
                    VerseText(
                      text:
                          "Judgment and Covenant Renewal\n“Surely the day is coming; it will burn like a furnace. All the arrogant and every evildoer will be stubble, and the day that is coming will set them on fire,” says the Lord Almighty. “Not a root or a branch will be left to them.",
                    ),
                    const Gap(15),
                    VerseText(
                      text: "New Living Translation 2011",
                      size: 20,
                    )
                  ],
                ),
              ),
              const Gap(15),
              Container(
                height: 900,
                width: double.maxFinite,
                decoration: BoxDecoration(color: Colors.blue),
                child: CreateNotePage(
                  titleParam: "Malakai 4:11",
                ),
              )
            ],
          ),
        ));
  }
}
