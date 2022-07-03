import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/splash_screen/splash_controller/splash_controller.dart';
import 'package:platzi_fake_store/view/page/view_category_screen/view_category_controller/view_category_controller.dart';


class ViewCategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ViewCategoryController>(()=> ViewCategoryController());
  }
}