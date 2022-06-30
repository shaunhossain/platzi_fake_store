import 'package:flutter/material.dart';

class CustomTextViewWithoutColor extends StatelessWidget {
  const CustomTextViewWithoutColor({Key? key, required this.text,  required this.fontSize,required this.fontWeight}) : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: 'Metropolis',
          decoration: TextDecoration.none
      ),
    );
  }
}
