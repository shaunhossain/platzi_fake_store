import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? width;
  static double? height;
  static double? textScaleFactor;
  static double? devicePixelRatio;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData!.size.width;
    height = _mediaQueryData!.size.height;
    textScaleFactor = _mediaQueryData!.textScaleFactor;
    devicePixelRatio = _mediaQueryData!.devicePixelRatio;
  }
}