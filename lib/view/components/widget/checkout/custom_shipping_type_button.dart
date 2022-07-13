import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomShippingTypeButton extends StatelessWidget {
  const CustomShippingTypeButton({Key? key, required this.title, required this.onTap}) : super(key: key);
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  Container(
        width: SizeConfig.width,
        height: 60,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.car_crash_outlined),
            CustomTextView(
                text: title,
                fontSize: SizeConfig.textScaleFactor! * 20,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
