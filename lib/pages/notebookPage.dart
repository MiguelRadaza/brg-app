import 'dart:convert';

import 'package:brg/pages/createNotePage.dart';
import 'package:brg/utils/appColor.dart';
import 'package:brg/utils/dimensions.dart';
import 'package:brg/widgets/bigText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';

import '../model/noteModel.dart';
import '../network_utils/noteApi.dart';

class NotebookPage extends StatefulWidget {
  const NotebookPage({Key? key}) : super(key: key);

  @override
  _NotebookPageState createState() => _NotebookPageState();
}

class _NotebookPageState extends State<NotebookPage> {
  final _storage = FlutterSecureStorage();
  bool _isLoading = false;
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    _getNotes(); // Fetch notes when the widget is first created
  }

  Future<void> _getNotes() async {
    setState(() {
      _isLoading = true;
    });

    var response = await NotebookNetwork().getNotes();
    var responseBody = response.body;
    if (responseBody == null) {
      // Handle the case where the response body is null
      setState(() {
        _isLoading = false;
      });
      return;
    }

    var notesData = json.decode(responseBody);

    // Clear the existing notes list before adding new ones
    notes.clear();

    // Since the notesData is a Map, you can directly access the 'data' field,
    // assuming that 'data' is the key containing the list of notes.
    var notesList = notesData['data'];

    for (var noteData in notesList) {
      Note note = Note(
        id: noteData['id'],
        title: noteData['title'],
        type: noteData['type'],
        date: noteData['created_at'],
      );
      notes.add(note);
    }

    setState(() {
      _isLoading = false;
    });
  }

  Widget _notebookListCard(Note note) {
    String shortenedTitle =
        note.title.length > 5 ? note.title.substring(0, 5) + '...' : note.title;

    String fullDateTime = note.date;
    String dateOnly = fullDateTime.substring(0, 10);
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.isabelLine, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [Icon(Icons.book), Text("  $shortenedTitle")],
          ),
          Text(note.type),
          Text(dateOnly),
          InkWell(
            child: Icon(Icons.edit),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => CreateNotePage(
                            id: note.id.toString(),
                          )));
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                const Gap(80),
                Row(
                  children: [
                    BigText(
                      text: "Notebook",
                      size: 24,
                    )
                  ],
                ),
                const Gap(20),
                InkWell(
                    onTap: () async {
                      var isNewNoteCreated = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateNotePage()),
                      );

                      // Check if a new note was created, and fetch notes again if needed.
                      if (isNewNoteCreated == true) {
                        _getNotes(); // Fetch notes again
                      }
                    },
                    child: Container(
                        height: Dimensions.height50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: AppColors.prussianBlue,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "Create Note",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ))), // Add notebook button
                const Gap(15),
                Container(
                    padding: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: Colors.black12,
                        width: 1.0, // Adjust the width as needed
                      ),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(17),
                          width: Dimensions.width250,
                          decoration: BoxDecoration(
                              color: AppColors.ashGrey,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text("Search: Date / Type "),
                        ),
                        Container(
                          padding: EdgeInsets.all(17),
                          decoration: BoxDecoration(
                              color: AppColors.robinEggBlue,
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                const Gap(0),

                Expanded(
                  // Wrap SingleChildScrollView with Expanded
                  child: SingleChildScrollView(
                    child: notes.length > 0
                        ? ListView.builder(
                            itemCount: notes.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true, // Remove this line
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  _notebookListCard(notes[index]),
                                  SizedBox(
                                      height: 10), // Add spacing between cards
                                ],
                              );
                            },
                          )
                        : Text("No notes found..."),
                  ),
                ),

              ],
            )));
  }
}
