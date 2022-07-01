import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/model/category/category.dart';

class HomeController extends GetxController {
  ScrollController productController = ScrollController();
  final isButtonPress = false.obs;
  final List<Category> productCategory = [
    Category(1,'cloths','assets/cloths.svg'),
    Category(2,'shoes','assets/shoes.svg'),
    Category(3,'furniture','assets/furniture.svg'),
    Category(4,'electronics','assets/electronics.svg'),
    Category(5,'more','assets/more.svg'),
  ].obs;
}