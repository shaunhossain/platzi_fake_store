import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomEmptyPage extends StatelessWidget {
  const CustomEmptyPage({Key? key, required this.asset, required this.warningTitle, required this.warningDes}) : super(key: key);
  final String asset;
  final String warningTitle;
  final String warningDes;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(asset,fit: BoxFit.scaleDown,),
            CustomTextView(
                text: warningTitle,
                fontSize: SizeConfig.textScaleFactor! * 18,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            CustomTextView(
                text: warningDes,
                fontSize: SizeConfig.textScaleFactor! * 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ],
        ));
  }
}
