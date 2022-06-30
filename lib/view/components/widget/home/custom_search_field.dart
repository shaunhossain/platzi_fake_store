import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField(
      {Key? key,
      required this.spacing,
      required this.userInput,
      required this.hint, required this.onTap})
      : super(key: key);
  final double spacing;
  final String hint;
  final TextEditingController userInput;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: spacing,
        ),
        TextFormField(
          style: TextStyle(
            fontSize: SizeConfig.textScaleFactor! * 20,
            fontWeight: FontWeight.w400,
          ),
          onChanged: (value) => userInput,
          controller: userInput,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade300,
            filled: true,
            errorStyle: TextStyle(
              color: Colors.redAccent,
              fontSize: SizeConfig.textScaleFactor! * 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
            isDense: true,
            contentPadding:
                const EdgeInsets.only(left: 16, bottom: 0, top: 0, right: -10),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: SizeConfig.width! * 0.06,
            ),
            suffixIcon: GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.filter_list,
                color: Colors.black,
                size: SizeConfig.width! * 0.06,
              ),
            ),
            hintText: hint,
            hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: SizeConfig.textScaleFactor! * 14),
          ),
        ),
      ],
    );
  }
}
