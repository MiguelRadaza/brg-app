import 'package:brg/pages/bottomBar.dart';
import 'package:brg/pages/createNotePage.dart';
import 'package:brg/pages/homePage.dart';
import 'package:brg/pages/registerPage.dart';
import 'package:brg/utils/appColor.dart';
import 'package:brg/utils/dimensions.dart';
import 'package:brg/widgets/bigText.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network_utils/api.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _storage = FlutterSecureStorage();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var email;
  var password;

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'sample',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    print("height: " + Get.height.toString());
    print("width: " + Get.width.toString());
    return Scaffold(
      key: _scaffoldKey,
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
                height: Dimensions.height552,
                padding: EdgeInsets.only(
                    top: Dimensions.height30,
                    right: Dimensions.width30,
                    left: Dimensions.width30),
                decoration: const BoxDecoration(
                    color: AppColors.isabelLine,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Email"),
                          controller: TextEditingController(
                              text: "business@miguel-radaza.com"),
                          validator: (emailValue) {
                            if (emailValue!.isEmpty) {
                              return 'Please enter email';
                            }
                            email = emailValue;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: TextEditingController(text: "welcome"),
                          decoration: InputDecoration(labelText: "Password"),
                          validator: (passwordValue) {
                            if (passwordValue!.isEmpty) {
                              return 'Please enter email';
                            }
                            password = passwordValue;
                          },
                        ),
                        const Gap(50),
                        Builder(
                            builder: (context) => InkWell(
                                  child: Container(
                                    width: double.maxFinite,
                                    height: Dimensions.height50,
                                    decoration: BoxDecoration(
                                        color: AppColors.ashGrey,
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    child: Center(
                                      child: BigText(
                                        text: "Submit",
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _login();
                                    }
                                  },
                                )),
                        const Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account yet?"),
                            const Gap(10),
                            InkWell(
                              child: const Text(
                                "Register",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                            )
                          ],
                        ),
                        const Text("All right Reserve Brg App @2023"),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};

    var res = await Network().authData(data);
    var body = json.decode(res.body);

    if (body['status']) {
      await _storage.write(key: 'token', value: body['token']);
      await _storage.write(key: 'user', value: jsonEncode(body['user']));

      Navigator.pushReplacementNamed(context, BottomBar.routeName);
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
