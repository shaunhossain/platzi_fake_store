import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/favorite_product/favorite_product_view_item.dart';
import 'package:platzi_fake_store/view/page/my_wishlist_screen/my_wishlist_controller/my_wishlist_controller.dart';

class MyWishlistScreen extends StatelessWidget {
  const MyWishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<MyWishlistController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                title: CustomTextView(
                    text: 'My wishlist',
                    fontSize: SizeConfig.textScaleFactor! * 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.searchProductScreen);
                      },
                      icon: const Icon(Icons.search_rounded))
                ],
                backgroundColor: Colors.white,
                bottomOpacity: 0.0,
                elevation: 0.3,
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
                child: Obx(
                      () => GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.79,
                      ),
                      controller: controller.orderProductListController,
                      itemCount: controller.listOfCompleteHabitFromLocal.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Obx(() => FavoriteProductViewItem(
                          productItem: controller.listOfCompleteHabitFromLocal[index],
                          onTap: () {
                            Get.toNamed(AppRoutes.viewProductScreen,
                                arguments:
                                controller.listOfCompleteHabitFromLocal[index]);
                          },
                        ),
                        );
                      }),
                ),
              )));
    });
  }
}
