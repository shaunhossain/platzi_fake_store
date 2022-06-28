import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';


class CustomSocialLoginButton extends StatelessWidget {
  const CustomSocialLoginButton({Key? key, required this.title, required this.padding, required this.buttonColor, required this.asset, required this.onPress}) : super(key: key);

  final String title;
  final double padding;
  final Color buttonColor;
  final String asset;
  final Function () onPress;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: MaterialButton(
          minWidth: SizeConfig.width,
          height: 44,
          elevation: 0,
          color: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                color: Color(0xFFE5F6FF),
              )
          ),
          onPressed: onPress,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(asset),
                const Spacer(),
                CustomTextView(text: title, fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                const Spacer()
              ],
            ),
          )),
    );
  }
}
