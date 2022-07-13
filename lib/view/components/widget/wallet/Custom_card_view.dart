import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/wallet/custom_top_up_button.dart';

class CustomCardView extends StatelessWidget {
  const CustomCardView({Key? key, required this.name, required this.balance, required this.topUp}) : super(key: key);
  final String name;
  final int balance;
  final Function() topUp;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextView(
                  text: name,
                  fontSize: SizeConfig.textScaleFactor! * 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              const SizedBox(height: 16,),
              CustomTextView(
                  text: '**** **** ***** 345',
                  fontSize: SizeConfig.textScaleFactor! * 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              const SizedBox(height: 24,),
              CustomTextView(
                  text: 'Your balance',
                  fontSize: SizeConfig.textScaleFactor! * 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              const SizedBox(height: 16,),
              CustomTextView(
                  text: '\u0024$balance',
                  fontSize: SizeConfig.textScaleFactor! * 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/visa_card.svg',
                    width: 40,
                    height: 15,
                  ),
                  SvgPicture.asset(
                    'assets/master_card.svg',
                    width: 40,
                    height: 25,
                  )
                ],
              ),
              SizedBox(height: SizeConfig.height! * 0.15,),
              CustomTopUpButton(minWidth: 60, height: 36, title: 'Top up', onPress: topUp),
            ],
          )
        ],
      ),
    );
  }
}
