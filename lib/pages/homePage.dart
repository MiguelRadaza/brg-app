import 'package:brg/utils/appColor.dart';
import 'package:brg/utils/dailyVerse.dart';
import 'package:brg/utils/dimensions.dart';
import 'package:brg/widgets/bigText.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> verses = dailyVerse;
    final DateTime now = DateTime.now();
    final int verseIndex = now.day % verses.length;
    final String verse = verses[verseIndex];

    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  BigText(
                    text: "Bible Reading Guide",
                    size: 30,
                  )
                ],
              ),
            ),
            const Gap(30),
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width25, right: Dimensions.width25),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.ashGrey,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Dimensions.width270,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: "365 Goal",
                              size: 20,
                            ),
                            BigText(
                              text: "100%",
                              size: 14,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: LinearPercentIndicator(
                              width: Dimensions.width270,
                              lineHeight: 14.0,
                              percent: 0.5,
                              backgroundColor: AppColors.isabelLine,
                              progressColor: AppColors.prussianBlue),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.book,
                      size: 34,
                    ),
                  )
                ],
              ),
            ),
            const Gap(15),
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width25, right: Dimensions.width25),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.isabelLine,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Verse of the Day",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24)),
                          child: Icon(
                            Icons.share,
                            size: 15,
                          ))
                    ],
                  ),
                  const Gap(15),
                  // Verse
                  Text(verse),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.calendar_month), Text(" 15 Feb")],
                  )
                ],
              ),
            ),
            const Gap(15),
            _devotionWidget(true),
            const Gap(15),
            _nightDevotionWidget(),
          ],
        )));
  }

  Widget _devotionWidget(isFinished) {
    return Container(
        margin: EdgeInsets.only(
            left: Dimensions.width25, right: Dimensions.width25),
        height: 160,
        width: double.maxFinite,
        child: !isFinished
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 8, 8, 8).withOpacity(0.2),
                ),
                child: (Center(
                    child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.lightOrange,
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Start your devotion",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_right)
                        ],
                      )),
                ))),
              )
            : Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.lightOrange,
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: "John 3:16",
                              size: 24,
                            ),
                            Container(
                              height: 30,
                              width: 90,
                              child: Center(
                                child: Text("Morning"),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.white),
                            )
                          ],
                        ),
                        const Gap(5),
                        Container(
                          child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit. In error unde aliquid, asperiores quos minima nihil est sit vero."),
                        ),
                        const Gap(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24)),
                                child: const Icon(
                                  Icons.share,
                                  size: 15,
                                )),
                            Container(
                              child: const Row(
                                children: [
                                  Icon(Icons.calendar_month),
                                  Text("  May 21, 2023")
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
              ));
  }

  Widget _nightDevotionWidget() {
    return Container(
      margin:
          EdgeInsets.only(left: Dimensions.width25, right: Dimensions.width25),
      height: 160,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.robinEggBlue,
          borderRadius: BorderRadius.circular(15)),
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: "John 3:16",
                    size: 24,
                  ),
                  Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white),
                    child: const Center(
                      child: Text("Morning"),
                    ),
                  )
                ],
              ),
              const Gap(5),
              Container(
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit. In error unde aliquid, asperiores quos minima nihil est sit vero."),
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: const Icon(
                        Icons.share,
                        size: 15,
                      )),
                  Container(
                    child: const Row(
                      children: [
                        Icon(Icons.calendar_month),
                        Text("  May 21, 2023")
                      ],
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
