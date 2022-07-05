import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewProductController extends GetxController {
  final activeIndex = 0.obs;
  List<Color> newColor = [Color(0xFEAB6022),Color(0xFF2AA952),Color(0xFF9B9B9B)];

  void onImageChange(int index , CarouselPageChangedReason reason){
    activeIndex.value = index;
    update();
  }
}