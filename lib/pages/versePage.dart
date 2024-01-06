import 'package:brg/widgets/bigText.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/Accordion.dart';

class VersesPage extends StatefulWidget {
  const VersesPage({Key? key}) : super(key: key);

  @override
  _VersesPageState createState() => _VersesPageState();
}

class _VersesPageState extends State<VersesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(
        children: [
          const Gap(95),
          BigText(
            text: "August 2023",
            size: 35,
          ),
          const Gap(20),
          Accordion(
            title: '23 #1',
            content: 'Lorem \n awdawdawawdawdaawdaw tristique.',
          ),
          Accordion(
            title: 'Section #1',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam bibendum ornare vulputate. Curabitur faucibus condimentum purus quis tristique.',
          ),
          Accordion(
            title: 'Section #1',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam bibendum ornare vulputate. Curabitur faucibus condimentum purus quis tristique.',
          ),
        ],
      ),)
    );
  }
}
