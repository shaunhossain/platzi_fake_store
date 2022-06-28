import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({Key? key, required this.minWidth, required this.height, required this.asset, required this.onPress}) : super(key: key);
  final double minWidth;
  final double height;
  final String asset;
  final Function () onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: minWidth,
        height: height,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.shade200,
            )
        ),
        onPressed: onPress,
        child: SvgPicture.asset(asset));
  }
}
