import 'package:brg/pages/devotionalPage.dart';
import 'package:brg/utils/appColor.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:slider_button/slider_button.dart';

class DevotionalOnBoarding extends StatefulWidget {
  const DevotionalOnBoarding({Key? key}) : super(key: key);

  @override
  _DevotionalOnBoardingState createState() => _DevotionalOnBoardingState();
}

class _DevotionalOnBoardingState extends State<DevotionalOnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ashGrey,
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            const Gap(180),
            Container(
              width: 380,
              height: 550,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _instruction("Have you prayed already?"),
                  _instruction("Are you in the quiet place?"),
                  _instruction("Have you prayed already?"),
                  _instruction("Have you prayed already?"),
                ],
              ),
            ),
            Expanded(
                child: Align(
              child: _slider(context),
              alignment: Alignment.bottomCenter,
            ))
          ],
        ),
      ),
    );
  }

  Widget _instruction(textValue) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 50,
            child: Checkbox(
              checkColor: Colors.white,
              // fillColor: MaterialStateProperty.resolveWith(Colors.white),
              value: true,
              onChanged: (bool? value) {
                // setState(() {
                //   isChecked = value!;
                // });
              },
            ),
          ),
          Text(
            textValue,
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }

  Widget _slider(context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        width: double.maxFinite,
        child: SliderButton(
          width: 388,
          action: () {
            // Navigator.of(context).pop();
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const DevotionalPage()),
            // );
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DevotionalPage()));
          },
          label: const Text(
            "Slide to start Devotion",
            style: TextStyle(
                color: Color(0xff4a4a4a),
                fontWeight: FontWeight.w500,
                fontSize: 25),
          ),
          icon: const Text(
            "x",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 44,
            ),
          ),
        ));
  }
}
