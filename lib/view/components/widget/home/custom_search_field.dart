import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField(
      {Key? key,
      required this.spacing,
      required this.hint,
      required this.onTap})
      : super(key: key);
  final double spacing;
  final String hint;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: spacing,
          ),
          Card(
            elevation: 0.1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: Container(
              width: SizeConfig.width,
              height: SizeConfig.height! * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 12),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: SizeConfig.width! * 0.06,
                        ),
                      ),
                      CustomTextView(
                          text: hint,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.grey,
                      size: SizeConfig.width! * 0.06,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
