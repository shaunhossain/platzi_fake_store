import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/view_product/custom_add_cart_button.dart';

class CustomProductFooter extends StatelessWidget {
  const CustomProductFooter({Key? key, required this.addCart, required this.price}) : super(key: key);
  final Function() addCart;
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
        CustomAddCartButton(
          minWidth: SizeConfig.width! * 0.6,
          height: 30,
          title: 'Add Cart',
          onPress: () {},
        ),
      ],
    );
  }
}
