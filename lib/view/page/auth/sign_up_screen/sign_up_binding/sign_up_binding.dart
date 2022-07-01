import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/auth/sign_up_screen/sign_up_controller/sign_up_controller.dart';


class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }

}