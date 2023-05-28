import 'package:brg/utils/appColor.dart';
import 'package:brg/utils/dimensions.dart';
import 'package:brg/widgets/bigText.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.ashGrey,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height90,
                    bottom: Dimensions.height15,
                    left: Dimensions.width15),
                child: const Row(
                  children: [
                    Text(
                      'Account Page',
                      style: TextStyle(
                          color: AppColors.prussianBlue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
                width: double.maxFinite,
                height: Dimensions.height680,
                padding: EdgeInsets.only(
                    top: Dimensions.height30,
                    right: Dimensions.height30,
                    left: Dimensions.height30),
                decoration: const BoxDecoration(
                    color: AppColors.isabelLine,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            BigText(
                              text: "General",
                              size: 20,
                            )
                          ],
                        ),
                        const Gap(15),
                        _settingsWidget(
                            Icons.person_2_outlined, " Account Information"),
                        const Gap(15),
                        Row(
                          children: [
                            BigText(
                              text: "Support",
                              size: 20,
                            )
                          ],
                        ),
                        const Gap(15),
                        _settingsWidget(Icons.question_mark, " FAQs"),
                        _settingsWidget(
                            Icons.warning_amber, " Report an Issue"),
                      ],
                    ),
                    const Gap(50),
                    Container(
                        height: Dimensions.height60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: AppColors.prussianBlue),
                            borderRadius: BorderRadius.circular(24)),
                        child: const Center(
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                                color: AppColors.prussianBlue, fontSize: 15),
                          ),
                        ))
                  ],
                )),
          ],
        )));
  }

  Widget _settingsWidget(icon, buttonText) {
    return Container(
      padding: EdgeInsets.only(
          bottom: Dimensions.height15, top: Dimensions.height15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1.0, // Adjust the width as needed
          ),
        ),
      ),
      margin:
          EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              Container(
                margin: const EdgeInsets.only(left: 0),
                child: Text(buttonText),
              ),
            ],
          ),
          const Icon(Icons.arrow_right)
        ],
      ),
    );
  }
}
