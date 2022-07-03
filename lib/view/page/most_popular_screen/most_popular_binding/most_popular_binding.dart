import 'package:get/get.dart';
import 'package:platzi_fake_store/view/page/most_popular_screen/most_popular_controller/most_popular_controller.dart';
import 'package:platzi_fake_store/view/page/my_wishlist_screen/my_wishlist_controller/my_wishlist_controller.dart';


class MostPopularBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MostPopularController>(()=>MostPopularController());
  }
}