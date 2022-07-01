import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/model/category/category.dart';
import 'package:platzi_fake_store/model/category/item_category.dart';
import 'package:platzi_fake_store/utils/conversion.dart';
import 'package:platzi_fake_store/utils/network_type/connection_type.dart';
import 'package:platzi_fake_store/view/page/home_screen/home_connect/home_connect.dart';
import 'package:platzi_fake_store/view/services/initial_controller/initial_controller.dart';

class HomeController extends GetxController {
  ScrollController productController = ScrollController();
  final activeIndex = 0.obs;
  final isButtonPress = false.obs;
  final RxString dataFetchingError = ''.obs;
  final List<Category> productCategory = <Category>[].obs;

  final IHomeProvider _homeProvider = IHomeProvider();
  final InitialController _controller = Get.find<InitialController>();

  @override
  void onInit() async {
    super.onInit();
    getAllCategory();

  }

  void getAllCategory(){
    if(_controller.connectionType.value == ConnectionType.mobile || _controller.connectionType.value == ConnectionType.wifi){
      try {
        _homeProvider.getAllProductCategory().then((value){
          try {
            final List<ItemCategory> loginResponse = itemCategoryFromMap(value);
            for (var item in loginResponse) {
              productCategory.add(Category(item.id, item.name,Conversion().selectIcon(name: item.name), item.image));
            }
            log(loginResponse.first.name);
          } on Exception catch (e) {
            dataFetchingError.value ="$e";
          }
        }, onError: (error){
          dataFetchingError.value ="$error";
        });
      } on SocketException {
        dataFetchingError.value ="No internet connection";
      }
    } else{
      dataFetchingError.value ="No internet connection";
    }
  }

  void onPageChange(int index , CarouselPageChangedReason reason){
    activeIndex.value = index;
    update();
  }
}