import 'package:flutter/material.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomProfileActionButton extends StatelessWidget {
  const CustomProfileActionButton({Key? key, required this.leadIcon, required this.title, required this.onTap, required this.actionWidget, required this.color}) : super(key: key);
  final IconData leadIcon;
  final String title;
  final Color color;
  final Widget actionWidget;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(leadIcon,size: 26,color: color,),
                const SizedBox(width: 20,),
                CustomTextView(
                    text: title,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: color),
              ],
            ),
            actionWidget,
          ],
        ),
      ),
    );
  }
}
