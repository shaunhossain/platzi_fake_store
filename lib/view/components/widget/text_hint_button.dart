import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextHintButton extends StatelessWidget {
  const TextHintButton({Key? key, required this.padding, required this.hintText, required this.hintButtonText, required this.onTap}) : super(key: key);
  final double padding;
  final String hintText;
  final String hintButtonText;
  final Function () onTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: RichText(
        text: TextSpan(
            text: hintText,
            style: TextStyle(
                color: Colors.grey.shade500, fontSize: 12,fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(text: hintButtonText,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
                  recognizer: TapGestureRecognizer()
                    ..onTap = onTap
              )
            ]
        ),
      ),
    );
  }
}
