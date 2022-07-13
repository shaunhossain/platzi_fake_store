import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/wallet_screen/wallet_controller/wallet_controller.dart';

class WalletBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(WalletController());
    //Get.lazyPut<WalletController>(()=> WalletController());
  }
}