import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomProductRate extends StatelessWidget {
  const CustomProductRate({Key? key, required this.sell, required this.rate, required this.reviews}) : super(key: key);
  final double sell;
  final double rate;
  final int reviews;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: [
        Container(
          width: SizeConfig.width! * 0.2,
          height: 25,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5)),
          child: CustomTextView(
              text: '$sell sold',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black),
        ),
        const SizedBox(
          width: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: Icon(
                Icons.star_half_rounded,
                color: Colors.black,
                size: 22,
              ),
            ),
            CustomTextView(
                text: '$rate ($reviews reviews)',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700),
          ],
        ),
      ],
    );
  }
}
