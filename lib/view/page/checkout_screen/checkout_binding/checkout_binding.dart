import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/checkout_screen/checkout_controller/checkout_controller.dart';


class CheckoutBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(()=>CheckoutController());
  }
}