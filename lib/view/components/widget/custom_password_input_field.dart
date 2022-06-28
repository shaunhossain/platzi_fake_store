import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';


class CustomPasswordInputField extends StatelessWidget {
  const CustomPasswordInputField({Key? key, required this.title, required this.spacing, required this.userPassword, required this.onPress, required this.visibility}) : super(key: key);

  final String title;
  final double spacing;
  final TextEditingController userPassword;
  final bool visibility;
  final Function() onPress;

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
          obscureText: visibility,
          onChanged: (value) => userPassword,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
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
            suffixIcon: GestureDetector(
              onTap: onPress,
              child: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
                size: SizeConfig.width! * 0.06,
              ),
            ),
            contentPadding: const EdgeInsets.only(
                left: 16, bottom: 0, top: 0, right: -10),
            hintText: 'enter password',
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
          ),
          controller: userPassword,
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
