import 'package:flutter/material.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomTextSpanButton extends StatelessWidget {
  const CustomTextSpanButton({Key? key, required this.title, required this.seeMore, required this.onPress}) : super(key: key);

  final String title;
  final String seeMore;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         CustomTextView(
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        TextButton(
          onPressed: onPress,
          child: CustomTextView(
            text: seeMore,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
