import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/profile_screen/profile_controller/profile_controller.dart';
import 'package:platzi_fake_store/view/page/special_offer_screen/special_offer_controller/special_offer_controller.dart';

class SpecialOfferBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SpecialOfferController>(()=> SpecialOfferController());
  }
}