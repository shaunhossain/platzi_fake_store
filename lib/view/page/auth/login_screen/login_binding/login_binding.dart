import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/auth/login_screen/login_controller/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(()=> LoginController());
  }
}