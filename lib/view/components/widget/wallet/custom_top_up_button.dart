import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomTopUpButton extends StatelessWidget {
  const CustomTopUpButton({Key? key, required this.minWidth, required this.height, required this.title, required this.onPress}) : super(key: key);
  final double minWidth;
  final double height;
  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialButton(
        minWidth: minWidth,
        height: height,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: onPress,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.archive_outlined,color: Colors.black,),
            const SizedBox(width: 8,),
            CustomTextView(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ],
        ));
  }
}
