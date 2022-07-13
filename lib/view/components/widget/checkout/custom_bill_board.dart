import 'package:flutter/material.dart';

import '../../../../utils/size_config.dart';
import '../custom_text_view.dart';

class CustomBillBoard extends StatelessWidget {
  const CustomBillBoard({Key? key, required this.price, required this.shippingCost, required this.totalBill}) : super(key: key);
  final int price;
  final int shippingCost;
  final int totalBill;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextView(
                  text: 'Amount',
                  fontSize: SizeConfig.textScaleFactor! * 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              CustomTextView(
                  text: '\u0024$price',
                  fontSize: SizeConfig.textScaleFactor! * 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ],
          ),
          const SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextView(
                  text: 'Shipping bill',
                  fontSize: SizeConfig.textScaleFactor! * 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              CustomTextView(
                  text: '\u0024$shippingCost',
                  fontSize: SizeConfig.textScaleFactor! * 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ],
          ),
          const SizedBox(height: 24,),
          const Divider(color: Colors.grey,height: 1,),
          const SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextView(
                  text: 'Total bill',
                  fontSize: SizeConfig.textScaleFactor! * 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              CustomTextView(
                  text: '\u0024$totalBill',
                  fontSize: SizeConfig.textScaleFactor! * 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}
