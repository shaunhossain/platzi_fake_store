import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/my_cart/custom_check_out_button.dart';

class CustomMyCartFooter extends StatelessWidget {
  const CustomMyCartFooter({Key? key, required this.checkOut, required this.price}) : super(key: key);
  final Function() checkOut;
  final int price;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const CustomTextView(
                text: 'Total price',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
            CustomTextView(
                text: '\u0024$price',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ],
        ),
        CustomCheckOutButton(
          minWidth: SizeConfig.width! * 0.6,
          height: 30,
          title: 'Check out',
          onPress: checkOut,
          icon: const Icon(Icons.arrow_forward,color: Colors.white,),
        ),
      ],
    );
  }
}
