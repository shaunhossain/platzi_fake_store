import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/order_screen/order_controller/order_controller.dart';
import 'package:platzi_fake_store/view/page/search_product_screen/search_product_controller/search_product_controller.dart';


class SearchProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SearchProductController>(()=> SearchProductController());
  }
}