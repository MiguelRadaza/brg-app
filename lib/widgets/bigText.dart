import 'package:brg/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String finalText = "";
    return Text(
      text,
      // exp.allMatches(text, 20),
      maxLines: 20,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
          fontFamily: 'Ubuntu',
          fontSize: size == 0 ? Dimensions.height20 : size),
    );
  }
}
