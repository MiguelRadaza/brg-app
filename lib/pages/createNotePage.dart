import 'package:brg/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/appColor.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  bool isMorning = true;
  @override
  Widget build(BuildContext context) {
    List<String> journalTypes = <String>['Morning', 'Evening'];
    String selectedType = journalTypes.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: Dimensions.width30, right: Dimensions.width30),
        child: Column(children: [
          const Gap(15),
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.isabelLine,
                borderRadius: BorderRadius.circular(15)),
            child: const TextField(
              decoration: InputDecoration(hintText: "Title"),
            ),
          ),
          const Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      isMorning = true;
                    });
                  },
                  child: (isMorning == true
                      ? _journalTypesWidget(AppColors.lightOrange, Icons.sunny,
                          "Morning", AppColors.prussianBlue)
                      : _journalTypesWidget(AppColors.prussianBlue, Icons.sunny,
                          "Morning", Colors.white))),

              InkWell(
                onTap: () {
                  setState(() {
                    print(isMorning);
                    isMorning = false;
                  });
                },
                child: (isMorning == false
                    ? _journalTypesWidget(AppColors.lightOrange, Icons.star,
                        "Evening", AppColors.prussianBlue)
                    : _journalTypesWidget(AppColors.prussianBlue, Icons.star,
                        "Evening", Colors.white)),
              ),

              // Container(
              //   height: Dimensions.height50,
              //   width: Dimensions.width180,
              //   decoration: BoxDecoration(
              //       color: AppColors.prussianBlue,
              //       borderRadius: BorderRadius.circular(15)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         child: Icon(
              //           Icons.star,
              //           color: Colors.white,
              //         ),
              //         margin: EdgeInsets.only(right: Dimensions.width10),
              //       ),
              //       Text(
              //         "Evening",
              //         style: TextStyle(color: Colors.white),
              //       )
              //     ],
              //   ),
              // ),
              // ==== Text Area
            ],
          ),
          const Gap(15),
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width15, right: Dimensions.width15),
            width: double.maxFinite,
            height: Dimensions.height550,
            decoration: BoxDecoration(
                color: AppColors.isabelLine,
                borderRadius: BorderRadius.circular(24)),
            child: const TextField(
              maxLines: 23,
            ),
          ),
          const Gap(15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: 70,
              width: 230,
              decoration: BoxDecoration(
                  color: AppColors.ashGrey,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: const Text(
                      "😍",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  const Text("What are you feeling \nright now?")
                ],
              ),
            ),
            Container(
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                  color: AppColors.ashGrey,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: const Icon(Icons.check),
                  ),
                  const Text("Save")
                ],
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  Widget _journalTypesWidget(
      widgetColor, iconWidget, widgetText, widgetTextColor) {
    return InkWell(
        onTap: () {
          setState(() {
            isMorning == true ? true : false;
          });
        },
        child: Container(
          height: Dimensions.height50,
          width: Dimensions.width180,
          decoration: BoxDecoration(
              color: widgetColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: Dimensions.width10),
                child: Icon(
                  iconWidget,
                  color: widgetTextColor,
                ),
              ),
              Text(
                widgetText,
                style: TextStyle(color: widgetTextColor),
              )
            ],
          ),
        ));
  }
}
