import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class VerseText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  VerseText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 24,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 24,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w300,
          fontFamily: 'Ubuntu',
          fontSize: size == 0 ? Dimensions.height20 : size),
    );
  }
}
