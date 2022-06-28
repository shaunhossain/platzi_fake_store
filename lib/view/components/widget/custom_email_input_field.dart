import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomEmailInputField extends StatelessWidget {
  const CustomEmailInputField(
      {Key? key, required this.title, required this.spacing, required this.userInput, required this.hint})
      : super(key: key);
  final String title;
  final double spacing;
  final String hint;
  final TextEditingController userInput;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextView(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade500),
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
          // inputFormatters: <TextInputFormatter>[
          //   FilteringTextInputFormatter.allow(
          //       RegExp(r'^\d{0,2}(?:[3456789]\d{0,8})?$')),
          // ],
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            errorStyle: TextStyle(
              color: Colors.redAccent,
              fontSize: SizeConfig.textScaleFactor! * 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
            isDense: true,
            contentPadding:
                const EdgeInsets.only(left: 16, bottom: 0, top: 0, right: -10),
            suffixIcon: GestureDetector(
              onTap: (){
                userInput.clear();
              },
              child: Icon(
                Icons.cancel,
                color: Colors.grey,
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
