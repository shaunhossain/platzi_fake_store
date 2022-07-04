import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/splash_screen/splash_controller/splash_controller.dart';
import 'package:platzi_fake_store/view/page/view_product_screen/view_product_controller/view_product_controller.dart';


class ViewProductsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ViewProductController>(()=> ViewProductController());
  }
}