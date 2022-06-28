import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, required this.color, required this.onPress, required this.textColor}) : super(key: key);
  final String title;
  final Color color;
  final Color textColor;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialButton(
        minWidth: SizeConfig.width,
        height: 44,
        elevation: 0,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
              color: color,
            )
        ),
        onPressed: onPress,
        child: Center(
          child: CustomTextView(text: title, fontSize: 15, fontWeight: FontWeight.w400, color: textColor),
        ));
  }
}
