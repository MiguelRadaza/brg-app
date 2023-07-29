import 'package:brg/pages/devotionalOnBoarding.dart';
import 'package:brg/utils/appColor.dart';
import 'package:brg/utils/dimensions.dart';
import 'package:brg/widgets/bigText.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VersePage extends StatefulWidget {
  const VersePage({Key? key}) : super(key: key);

  @override
  _VersePageState createState() => _VersePageState();
}

class _VersePageState extends State<VersePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width25, right: Dimensions.width25),
                child: Column(
                  children: [
                    const Gap(80),
                    Center(
                        child: Column(
                      children: [
                        BigText(
                          text: "May 21, 2023",
                          size: 30,
                        ),
                        const Text("Today"),
                      ],
                    )),
                    _verseCard(),
                    _verseCard(),
                    _verseCard(),
                    _verseCard(),
                    _verseCard(),
                  ],
                ))));
  }

  Widget _verseCard() {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      height: 200,
      width: 400,
      decoration: BoxDecoration(
          color: AppColors.ashGrey, borderRadius: BorderRadius.circular(15)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: BigText(
              text: "25",
              size: 20,
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 15, left: 15),
            width: 280,
            child: Column(
              children: [
                // Morning
                Container(
                    height: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            BigText(
                              text: "Morning",
                              size: 24,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BigText(
                              text: "John 16:11",
                              size: 19,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DevotionalOnBoarding()),
                                  );
                                },
                                child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Row(
                                  children: [
                                    Icon(Icons.start),
                                    const Gap(10),
                                    BigText(
                                      text: "START",
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                                ))
                          ],
                        )
                      ],
                    )),

                // EVENING
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BigText(
                          text: "Evening",
                          size: 24,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BigText(
                          text: "John 16:11",
                          size: 19,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(Icons.view_agenda),
                                const Gap(10),
                                BigText(
                                  text: "VIEW",
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )),
      ]),
    );
  }
}
