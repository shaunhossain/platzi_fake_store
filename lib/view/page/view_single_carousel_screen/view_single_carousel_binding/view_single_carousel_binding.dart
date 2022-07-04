import 'package:get/get.dart';

import '../view_single_carousel_controller/view_single_carousel_controller.dart';


class ViewSingleCarouselBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ViewSingleCarouselController>(()=> ViewSingleCarouselController());
  }
}