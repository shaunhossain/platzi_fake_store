import 'package:flutter/material.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.spaceHeight, required this.title}) : super(key: key);
  final double spaceHeight;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: spaceHeight,
        ),
        CustomTextView(
            text: title,
            fontSize: 38,
            fontWeight: FontWeight.w400,
            color: Colors.black),
      ],
    );
  }
}
