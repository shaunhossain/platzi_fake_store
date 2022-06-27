import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/profile_screen/profile_controller/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(()=> ProfileController());
  }
}