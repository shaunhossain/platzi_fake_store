import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/db/cart_db_operation/cart_db_operation.dart';
import 'package:platzi_fake_store/db/db_model/add_cart_product.dart';
import 'package:platzi_fake_store/model/product/product_item.dart';
import 'package:platzi_fake_store/view/page/cart_screen/cart_controller/cart_controller.dart';

class ViewProductController extends GetxController {
  final activeIndex = 0.obs;
  final productQuantity = 1.obs;
  Color selectedColor = const Color(0xFFDB3022);
  String selectedSize =  'S';
  var isLikedProduct = false.obs;
  List<Color> availableColors = [
    const Color(0xFFDB3022),
    const Color(0xFF2AA952),
    const Color(0xFF7CBD3A),
    const Color(0xFFBE23BC),
  ];

  List<String> availableSizes = [
    'S',
    'M',
    'L',
    'XL'
  ];
  
  Future<void> addProductToCart(ProductItem productItem) async {
    final item = AddCartProduct(title: productItem.title,
        price: productItem.price * productQuantity.value,
        description: productItem.description,
        category: jsonEncode(productItem.category),
        images: jsonEncode(productItem.images),
        color: selectedColor.value,
        size: selectedSize,
        quantity: productQuantity.value,
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String());
    int id = await CartDbOperation.instance.addCart(item);
    log(id.toString());
    Get.find<CartController>().getAllCartData();
  }

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