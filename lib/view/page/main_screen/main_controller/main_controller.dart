import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var pageIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    pageIndex = index;
    update();
  }

  void selectNavItem(int index) {
    pageIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    update();
  }
}