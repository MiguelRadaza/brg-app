import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';

import '../network_utils/api.dart';
import '../utils/appColor.dart';
import '../utils/dimensions.dart';
import '../utils/snackBarsUtils.dart';
import '../widgets/bigText.dart';
import 'bottomBar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _storage = FlutterSecureStorage();
  bool _isLoading = false;
  var email;
  var password;
  final _formKey = GlobalKey<FormState>(); // Add Form key
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                const Gap(160),
                Container(
                  margin: const EdgeInsets.only(top: 90, bottom: 15, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to BRG App',
                        style: TextStyle(
                          color: AppColors.prussianBlue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "This app needs an account so that we can store your progress.",
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 504,
                  decoration: BoxDecoration(
                    color: AppColors.ashGrey,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Form(
                      // Add Form here
                      key: _formKey, // Set Form key
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(labelText: "Email"),
                            controller: TextEditingController(
                              text: "business@miguel-radaza.com",
                            ),
                            validator: (emailValue) {
                              if (emailValue!.isEmpty) {
                                return 'Please enter email';
                              }
                              email = emailValue;
                              return null;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: TextEditingController(text: "welcome"),
                            decoration: InputDecoration(labelText: "Password"),
                            validator: (passwordValue) {
                              if (passwordValue!.isEmpty) {
                                return 'Please enter password';
                              }
                              password = passwordValue;
                              return null;
                            },
                          ),
                          const Gap(24),
                          InkWell(
                            child: Container(
                              width: double.maxFinite,
                              height: Dimensions.height50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Center(
                                child: BigText(
                                  text: "Register",
                                  size: 20,
                                ),
                              ),
                            ),
                            onTap: () {
                              _register(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.1),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  void _register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      var data = {'email': email, 'password': password};

      var res = await Network().register(data);
      var body = json.decode(res.body);

      if (body['status']) {
        await _storage.write(key: 'token', value: body['token']);
        await _storage.write(key: 'user', value: jsonEncode(body['user']));
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacementNamed(context, BottomBar.routeName);
      } else {
        setState(() {
          _isLoading = false;
        });
        if (body['errors'] != null) {
          // ignore: use_build_context_synchronously
          showMessageWithMessagesArray(
              body['message'], "Undo", context, body['errors']);
        } else {
          // ignore: use_build_context_synchronously
          showMessage(body['message'], "Register", context);
        }
      }
    }
  }
}
