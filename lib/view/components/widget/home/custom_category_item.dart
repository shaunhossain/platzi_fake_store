import 'package:flutter/material.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';


class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);
  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          CustomTextView(text: title, fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black,),
        ],
      ),
    );
  }
}
