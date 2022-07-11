import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/db/db_model/favorite_product.dart';
import 'package:platzi_fake_store/db/favorite_db_operation/favorite_db_operation.dart';
import 'package:platzi_fake_store/model/category/category.dart';
import 'package:platzi_fake_store/model/category/item_category.dart';
import 'package:platzi_fake_store/model/offer/offer.dart';
import 'package:platzi_fake_store/model/product/product_item.dart';
import 'package:platzi_fake_store/model/profile/profile.dart';
import 'package:platzi_fake_store/utils/conversion.dart';
import 'package:platzi_fake_store/utils/network_type/connection_type.dart';
import 'package:platzi_fake_store/utils/store_user_sessions/store_user_sessions.dart';
import 'package:platzi_fake_store/view/page/home_screen/home_connect/home_connect.dart';
import 'package:platzi_fake_store/view/services/initial_controller/initial_controller.dart';

class HomeController extends GetxController {
  final activeIndex = 0.obs;
  final isButtonPress = false.obs;
  final RxString dataFetchingError = ''.obs;
  final List<Category> productCategory = <Category>[].obs;
  final List<Offer> offerList = <Offer>[].obs;
  List<ProductItem> allProduct = <ProductItem>[].obs;
  var categoryProgressBar = true.obs;
  var productProgressBar = true.obs;
  var showShimmerEffect = false.obs;
  var likedProductList = <int>[].obs;

  final _storage = StoreUserSessions();
  var profileInfo = <Profile>[].obs;

  /// initially the current page offset is 0
  var currentPageOffset = 0.obs;

  /// control data pull request from this controller
  /// the ScrollController is for listview control
  ScrollController productListController = ScrollController();

  final IHomeProvider _homeProvider = IHomeProvider();
  final InitialController _controller = Get.find<InitialController>();

  @override
  void onInit() async {
    super.onInit();
    String? token = await _storage.getToken();
    Future.delayed( Duration.zero,(){
      getUserInfo(token: token!);
    });
    getAllCategory();
    getSomeProduct();
    scrollingUpdate();
  }

  scrollingUpdate() async {
    productListController.addListener(() {
      if (productListController.position.maxScrollExtent ==
          productListController.position.pixels) {
        log('scroll');
        if (currentPageOffset.value > 0) {
          getAllProduct(offset: currentPageOffset.value);
        }
        currentPageOffset.value += 10;
      }
    });
  }

  void getAllCategory() {
    if (_controller.connectionType.value == ConnectionType.mobile ||
        _controller.connectionType.value == ConnectionType.wifi) {
      try {
        _homeProvider.getAllProductCategory().then((value) {
          try {
            final List<ItemCategory> response = itemCategoryFromMap(value);
            for (var item in response) {
              productCategory.add(Category(item.id, item.name,
                  Conversion().selectIcon(name: item.name), item.image));
            }
            //log(response.first.name);
          } on Exception catch (e) {
            dataFetchingError.value = "$e";
          }
        }, onError: (error) {
          dataFetchingError.value = "$error";
        });
      } on SocketException {
        dataFetchingError.value = "No internet connection";
      }
    } else {
      dataFetchingError.value = "No internet connection";
    }
  }

  void getAllProduct({required int offset}) {
    if (_controller.connectionType.value == ConnectionType.mobile ||
        _controller.connectionType.value == ConnectionType.wifi) {
      try {
        _homeProvider.getAllProducts(offset: offset).then((value) {
          try {
            final List<ProductItem> response = productItemFromJson(value);
            allProduct.addAll(response);
          } on Exception catch (e) {
            dataFetchingError.value = "$e";
          }
        }, onError: (error) {
          dataFetchingError.value = "$error";
        });
      } on SocketException {
        dataFetchingError.value = "No internet connection";
      }
    } else {
      dataFetchingError.value = "No internet connection";
    }
  }

  void getSomeProduct() {
    if (_controller.connectionType.value == ConnectionType.mobile ||
        _controller.connectionType.value == ConnectionType.wifi) {
      try {
        _homeProvider.getSomeProducts().then((value) {
          try {
            final List<ProductItem> response = productItemFromJson(value);
            allProduct = response;
            for (var item in response) {
              offerList.add(Offer(
                  offerPercentage: item.price > 500 ? '30%' : '15%',
                  offerMassage: 'Today\'s Special',
                  item: item));
            }
          } on Exception catch (e) {
            dataFetchingError.value = "$e";
          }
        }, onError: (error) {
          dataFetchingError.value = "$error";
        });
      } on SocketException {
        dataFetchingError.value = "No internet connection";
      }
    } else {
      dataFetchingError.value = "No internet connection";
    }
  }

  Future<void> getUserInfo({required String token}) async {
    if(_controller.connectionType.value == ConnectionType.mobile || _controller.connectionType.value == ConnectionType.wifi){
      try {
        _homeProvider.getUserProfileInfo(token: token).then((value){
          try {
            final Profile response = profileFromJson(value);
            profileInfo.add(response);
            log("profile name -> ${response.name}");

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

  void onPageChange(int index, CarouselPageChangedReason reason) {
    activeIndex.value = index;
    update();
  }

  Future<void> likedProduct(ProductItem productItem) async {
    if (!likedProductList.contains(productItem.id)) {
      likedProductList.add(productItem.id);
      final favoriteProduct = FavoriteProduct(id: productItem.id, title: productItem.title, price: productItem.price, description: productItem.description, category: jsonEncode(productItem.category), images: jsonEncode(productItem.images), createdAt: DateTime.now().toIso8601String(), updatedAt: DateTime.now().toIso8601String());
      int id = await FavoriteDbOperation.instance.add(favoriteProduct);
      log(id.toString());
    } else {
      likedProductList.remove(productItem.id);
      await FavoriteDbOperation.instance.remove(productItem.id);
    }
  }
}
