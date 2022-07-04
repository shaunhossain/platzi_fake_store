import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:platzi_fake_store/model/offer/offer.dart';
import 'package:platzi_fake_store/model/product/product_item.dart';
import 'package:platzi_fake_store/utils/network_type/connection_type.dart';
import 'package:platzi_fake_store/view/page/home_screen/home_controller/home_controller.dart';
import 'package:platzi_fake_store/view/page/special_offer_screen/special_offer_connect/special_offer_connect.dart';
import 'package:platzi_fake_store/view/services/initial_controller/initial_controller.dart';

class SpecialOfferController extends GetxController {
  late List<Offer> offerList = <Offer>[].obs;
  final RxString dataFetchingError = ''.obs;

  final ISpecialOfferProvider _offerProvider = ISpecialOfferProvider();
  final InitialController _controller = Get.find<InitialController>();
  final HomeController _controllerOfHome = Get.find<HomeController>();

  @override
  void onInit() async {
    super.onInit();
    offerList = _controllerOfHome.offerList;
  }

  // void getAllProduct(){
  //   if(_controller.connectionType.value == ConnectionType.mobile || _controller.connectionType.value == ConnectionType.wifi){
  //     try {
  //       _offerProvider.getSomeProducts().then((value){
  //         try {
  //           final List<ProductItem> response = productItemFromJson(value);
  //           for (var item in response) {
  //             log(response.toString());
  //             offerList.add(Offer(offerPercentage: item.price > 500 ? '30%' : '15%', offerMassage: 'Today\'s Special',description: item.description,image: item.images!.last));
  //           }
  //         } on Exception catch (e) {
  //           dataFetchingError.value ="$e";
  //         }
  //       }, onError: (error){
  //         dataFetchingError.value ="$error";
  //       });
  //     } on SocketException {
  //       dataFetchingError.value ="No internet connection";
  //     }
  //   } else{
  //     dataFetchingError.value ="No internet connection";
  //   }
  // }
}