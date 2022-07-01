import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomCategoryButton extends StatelessWidget {
  const CustomCategoryButton(
      {Key? key,
      required this.title,
      required this.padding,
      required this.buttonColor,
      required this.onPress, required this.textColor})
      : super(key: key);

  final String title;
  final double padding;
  final Color buttonColor;
  final Color textColor;

  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8),
      child: MaterialButton(
          height: 35,
          elevation: 0,
          color: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(
                color: Colors.black,
              )),
          onPressed: onPress,
          child: Center(
            child: CustomTextView(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColor),
          )),
    );
  }
}
