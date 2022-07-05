import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomAddCartButton extends StatelessWidget {
  const CustomAddCartButton(
      {Key? key,
      required this.minWidth,
      required this.height,
      required this.title,
      required this.onPress})
      : super(key: key);

  final double minWidth;
  final double height;
  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialButton(
        minWidth: minWidth,
        height: 44,
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: onPress,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_shopping_cart,color: Colors.white,),
            SizedBox(width: SizeConfig.width! * 0.1,),
            CustomTextView(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ],
        ));
  }
}
