// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.maxLines = 1,
    this.height = 1.0,
    this.textDecoration = TextDecoration.none,
    this.overflow = TextOverflow.visible,
    this.fontSize = 14,
    this.textAlign = TextAlign.start,
  }) : super(key: key);
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize, height;
  final int maxLines;
  final TextOverflow overflow;
  final TextDecoration textDecoration;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          decoration: textDecoration,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: height),
    );
  }
}
