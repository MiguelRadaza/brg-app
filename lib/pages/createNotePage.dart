import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

import 'package:brg/network_utils/noteApi.dart';
import 'package:brg/utils/dimensions.dart';
import 'package:brg/widgets/bigText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import '../utils/appColor.dart';

class CreateNotePage extends StatefulWidget {
  final String titleParam;
  const CreateNotePage({Key? key, this.titleParam = ""}) : super(key: key);

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final _storage = FlutterSecureStorage();
  List<String> journalTypes = <String>['Morning', 'Evening'];
  bool isMorning = true;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedType = '';
  var title = '';
  var dateTime = DateTime.now();
  var content = '';
  bool light0 = true;
  bool light1 = true;

  @override
  void initState() {
    super.initState();
    selectedType =
        journalTypes.first; // Set the default selected type to 'Morning'
  }

  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      // Track color when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return Colors.amber;
      }
      // Otherwise return null to set default track color
      // for remaining states such as when the switch is
      // hovered, focused, or disabled.
      return null;
    },
  );

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.sunny);
      }
      return const Icon(Icons.nightlight_outlined);
    },
  );

  @override
  Widget build(BuildContext context) {
    print(widget.titleParam);
    return Scaffold(
      appBar: widget.titleParam.isEmpty
          ? AppBar(
              title: const Text(''),
            )
          : null,
      body: Container(
        padding: EdgeInsets.only(
            left: Dimensions.width30, right: Dimensions.width30),
        child: Form(
            key: _formKey,
            child: Column(children: [
              const Gap(15),
              Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  decoration: BoxDecoration(
                      color: AppColors.isabelLine,
                      borderRadius: BorderRadius.circular(15)),
                  child: widget.titleParam == ""
                      ? TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(hintText: "Title"),
                          validator: (titleValue) {
                            if (titleValue!.isEmpty) {
                              return 'Please enter title';
                            }
                            title = titleValue;
                          },
                        )
                      : TextFormField(
                          keyboardType: TextInputType.text,
                          controller:
                              TextEditingController(text: widget.titleParam),
                          decoration: InputDecoration(hintText: "Title"),
                          validator: (titleValue) {
                            if (titleValue!.isEmpty) {
                              return 'Please enter title';
                            }
                            title = titleValue;
                          },
                        )),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: "Journal Type: ",
                    size: 20,
                  ),
                  BigText(
                    text: selectedType,
                    size: 20,
                  ),
                  Switch(
                    thumbIcon: thumbIcon,
                    trackColor: trackColor,
                    value: light1,
                    onChanged: (bool value) {
                      setState(() {
                        light1 = value;
                        if (selectedType == journalTypes.first) {
                          selectedType = journalTypes.last;
                        } else {
                          selectedType = journalTypes.first;
                        }
                      });
                    },
                  ),
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (contentValue) {
                    if (contentValue!.isEmpty) {
                      return 'Please enter content.';
                    }
                    content = contentValue;
                  },
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
                        child: Text(
                          "😍",
                          style: TextStyle(fontSize: 24),
                        ),
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text("What are you feeling \nright now?")
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.ashGrey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(Icons.check),
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text("Save")
                      ],
                    ),
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _saveNote();
                    }
                  },
                )
              ]),
            ])),
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
                child: Icon(
                  iconWidget,
                  color: widgetTextColor,
                ),
                margin: EdgeInsets.only(right: Dimensions.width10),
              ),
              Text(
                widgetText,
                style: TextStyle(color: widgetTextColor),
              )
            ],
          ),
        ));
  }

  Future<void> _saveNote() async {
    setState(() {
      _isLoading = true;
    });
    var user = await _storage.read(key: 'user');
    Map<String, dynamic> userData = jsonDecode(user!);

    var param = {
      'user_id': userData['id'],
      'day': dateTime.day,
      'month': dateTime.month,
      'type': selectedType,
      'title': title,
      'content': content,
    };
    var response = await NotebookNetwork().createNote(param);
    print(param);

    var responseBody = response.body; // Access the body of the Response object
    var body = json.decode(responseBody);

    Navigator.pop(context, true);
  }
}
