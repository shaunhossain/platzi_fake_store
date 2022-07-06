import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/model/product/product_item.dart';
import 'package:platzi_fake_store/utils/network_type/connection_type.dart';
import 'package:platzi_fake_store/view/services/initial_controller/initial_controller.dart';
import '../view_single_category_connect/view_single_category_connect.dart';

class ViewSingleCategoryController extends GetxController {
  final RxString dataFetchingError = ''.obs;
  final allProductOfCategory = <ProductItem>[].obs;
  String? categoryId;
  var likedProductList = <int>[].obs;

  /// initially the current page offset is 0
  var currentPageOffset = 0.obs;

  /// control data pull request from this controller
  /// the ScrollController is for listview control
  ScrollController categoryProductListController = ScrollController();

  final IViewSingleCategoryProvider _singleCategoryProvider = IViewSingleCategoryProvider();
  final InitialController _controller = Get.find<InitialController>();

  @override
  void onInit() async {
    super.onInit();
    Future.delayed( Duration.zero,(){
      scrollingUpdate(categoryId: categoryId!, offset: currentPageOffset.value);
    });
  }

  scrollingUpdate({required String categoryId, required int offset}) async {
    if(offset==0){
      getAllProductsOfCategory(categoryId: categoryId, offset: offset);
    }
    categoryProductListController.addListener(() {
      if (categoryProductListController.position.maxScrollExtent ==
          categoryProductListController.position.pixels) {
        getAllProductsOfCategory(categoryId: categoryId, offset: currentPageOffset.value);
        currentPageOffset.value +=10;
      }
    });
  }

  getCategoryId({required String id}){
    categoryId = id;
    update();
  }



  void getAllProductsOfCategory({required String categoryId, required int offset}){
    if(_controller.connectionType.value == ConnectionType.mobile || _controller.connectionType.value == ConnectionType.wifi){
      try {
        _singleCategoryProvider.getAllProductOfCategory(categoryId: categoryId,offset: offset).then((value){
          try {
            final List<ProductItem> response = productItemFromJson(value);
            for (var value in response) {
              allProductOfCategory.add(value);
            }
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

  void likedProduct(ProductItem productItem){
    if(!likedProductList.contains(productItem.id)){
      likedProductList.add(productItem.id);
    }else{
      likedProductList.remove(productItem.id);
    }
  }
}