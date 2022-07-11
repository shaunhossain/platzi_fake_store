import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomProductCount extends StatelessWidget {
  const CustomProductCount({Key? key, required this.countNumber, required this.remove, required this.add}) : super(key: key);
  final int countNumber;
  final Function() remove;
  final Function() add;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomTextView(
            text: 'Quantity',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        const SizedBox(
          width: 12,
        ),
        Container(
          width: SizeConfig.width! * 0.35,
          height: SizeConfig.height! * 0.05,
          decoration: ShapeDecoration(
            color: Colors.grey.shade300,
            shape: const StadiumBorder(),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: remove,
                color: Colors.black,
                icon: const Icon(
                  Icons.remove,
                  size: 16,
                ),
              ),
              CustomTextView(
                  text: countNumber.toString(),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              IconButton(
                onPressed: add,
                color: Colors.black,
                icon: const Icon(
                  Icons.add,
                  size: 16,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
