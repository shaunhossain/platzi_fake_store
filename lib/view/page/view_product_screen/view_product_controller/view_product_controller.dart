import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewProductController extends GetxController {
  final activeIndex = 0.obs;
  final productQuantity = 1.obs;
  Color? selectedColor;
  String? selectedSize;
  var isLikedProduct = false.obs;
  List<Color> availableColors = [
    Color(0xFFDB3022),
    Color(0xFF2AA952),
    Color(0xFF7CBD3A),
    Color(0xFFBE23BC),
  ];

  List<String> availableSizes = [
    'S',
    'M',
    'L',
    'XL'
  ];

  void onImageChange(int index , CarouselPageChangedReason reason){
    activeIndex.value = index;
    update();
  }
  void increaseQuantity(){
    productQuantity.value++;
  }

  void decreaseQuantity(){
    productQuantity.value--;
    if(productQuantity.value.isNegative){
      productQuantity.value = 0;
    }
  }

  void selectProductColor(Color color){
    selectedColor = color;
    update();
  }

  void selectProductSize(String size){
    selectedSize = size;
    update();
  }

  void likedProduct() {
    isLikedProduct.value = !isLikedProduct.value;
  }
}