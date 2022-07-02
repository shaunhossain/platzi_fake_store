import 'package:flutter/material.dart';

class CustomTextViewWithLine extends StatelessWidget {
  const CustomTextViewWithLine({Key? key, required this.text,  required this.fontSize,required this.fontWeight,required this.color }) : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.clip,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Metropolis',
      ),
    );
  }
}
