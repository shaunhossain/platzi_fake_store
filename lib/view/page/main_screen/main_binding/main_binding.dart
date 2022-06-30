import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/home_screen/home_binding/home_binding.dart';
import 'package:platzi_fake_store/view/page/home_screen/home_controller/home_controller.dart';
import 'package:platzi_fake_store/view/page/main_screen/main_controller/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MainController>(()=> MainController());
    HomeBinding().dependencies();
  }
}