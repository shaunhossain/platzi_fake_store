import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view_ellipsis.dart';


class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);
  final String title;
  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
            child:SvgPicture.asset(
                icon,
                width: 30,
                height: 30,
                fit: BoxFit.scaleDown,
                semanticsLabel: 'category item'
            )
          ),
          Container(
            height: 10,
          ),
          CustomTextViewEllipsis(text: title, fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black,),
        ],
      ),
    );
  }
}
