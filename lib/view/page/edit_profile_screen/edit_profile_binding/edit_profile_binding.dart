import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/edit_profile_screen/edit_profile_controller/edit_profile_controller.dart';


class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(()=>EditProfileController());
  }
}