import 'package:brg/utils/appColor.dart';
import 'package:brg/widgets/bigText.dart';
import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String content;

  const Accordion({Key? key, required this.title, required this.content})
      : super(key: key);
  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  // Show or hide the content
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
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
                  child: BigText(text: "24"),
                ),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
              ),
              // Container(
              //   height: 50,
              //   width: 100,
              //   child: Center(
              //     child: BigText(text: "Start"),
              //   ),
              //   decoration: BoxDecoration(
              //       color: AppColors.ashGrey,
              //       borderRadius: BorderRadius.circular(10)),
              // ),
              // Container(
              //   height: 50,
              //   width: 100,
              //   child: Center(
              //     child: BigText(text: "View"),
              //   ),
              //   decoration: BoxDecoration(
              //       color: AppColors.lightOrange,
              //       borderRadius: BorderRadius.circular(10)),
              // ),
              IconButton(
                icon: Icon(
                    _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                onPressed: () {
                  setState(() {
                    _showContent = !_showContent;
                  });
                },
              ),
            ],
          ),
        ),
        // Show or hide the content based on the state
        _showContent
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
                              "Matthew 6:33",
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
                              "Matthew 6:33",
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
