import 'package:brg/utils/appColor.dart';
import 'package:brg/widgets/bigText.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ashGrey,
      body: Container(
        child: Column(
          children: [
            const Gap(150),
            Container(
                margin: EdgeInsets.only(top: 90, bottom: 15, left: 15),
                child: const Row(
                  children: [
                    Text(
                      'Welcome to BRG App',
                      style: TextStyle(
                          color: AppColors.prussianBlue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
                width: double.maxFinite,
                height: 634,
                padding: EdgeInsets.only(top: 30, right: 30, left: 30),
                decoration: const BoxDecoration(
                    color: AppColors.isabelLine,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    const TextField(
                      decoration: InputDecoration(labelText: "Password"),
                    ),
                    const Gap(50),
                    Container(
                      width: double.maxFinite,
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.ashGrey,
                          borderRadius: BorderRadius.circular(24)),
                      child: Center(
                        child: BigText(
                          text: "Submit",
                          size: 20,
                        ),
                      ),
                    ),
                    const Gap(30),
                    Text("Allright Reserve Brg App @2023")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
