import 'package:brg/pages/createNotePage.dart';
import 'package:brg/utils/appColor.dart';
import 'package:brg/utils/dimensions.dart';
import 'package:brg/widgets/bigText.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotebookPage extends StatefulWidget {
  const NotebookPage({Key? key}) : super(key: key);

  @override
  _NotebookPageState createState() => _NotebookPageState();
}

class _NotebookPageState extends State<NotebookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: SingleChildScrollView(
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateNotePage()));
                    },
                    child: Container(
                        height: Dimensions.height50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: AppColors.prussianBlue,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            "Create Note",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ))), // Add notebook button
                const Gap(15),
                Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    decoration: const BoxDecoration(
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
                          padding: const EdgeInsets.all(17),
                          width: Dimensions.width250,
                          decoration: BoxDecoration(
                              color: AppColors.ashGrey,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text("Search: Date / Type "),
                        ),
                        Container(
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                              color: AppColors.robinEggBlue,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                _notebookListCard(),
                _notebookListCard(),
                _notebookListCard(),
                _notebookListCard(),
                _notebookListCard(),
                _notebookListCard(),
              ],
            ))));
  }

  Widget _notebookListCard() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.isabelLine, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [Icon(Icons.book), Text("  Title")],
          ),
          const Text("Morning"),
          const Text("2023-05-20"),
          InkWell(
            child: const Icon(Icons.edit),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateNotePage()));
            },
          )
        ],
      ),
    );
  }
}
