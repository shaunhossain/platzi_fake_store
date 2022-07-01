import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/view/components/widget/custom_progress_indicator.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';


class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({Key? key, required this.minWidth, required this.height, required this.title, required this.onPress, required this.showProgress}) : super(key: key);

  final dynamic minWidth;
  final double height;
  final String title;
  final Function () onPress;
  final bool showProgress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: minWidth,
        height: 44,
        color: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
        onPressed: onPress,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextView(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white),
            showProgress == false ?
                const CustomProgressIndicator() : const SizedBox()
          ],
        ));
  }
}
