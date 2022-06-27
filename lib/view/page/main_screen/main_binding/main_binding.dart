import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/main_screen/main_controller/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MainController>(()=> MainController());
  }
}