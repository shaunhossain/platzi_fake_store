import 'package:get/get.dart';
import 'package:platzi_fake_store/view/services/initial_controller/initial_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(InitialController());
  }

}