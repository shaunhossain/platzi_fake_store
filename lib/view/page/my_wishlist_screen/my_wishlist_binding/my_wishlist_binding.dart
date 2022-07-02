import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/my_wishlist_screen/my_wishlist_controller/my_wishlist_controller.dart';


class MyWishlistBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MyWishlistController>(()=>MyWishlistController());
  }
}