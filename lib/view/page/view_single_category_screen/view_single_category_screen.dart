import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/model/category/category.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/home/product_view_item.dart';
import 'package:platzi_fake_store/view/page/view_single_category_screen/view_single_category_controller/view_single_category_controller.dart';

class ViewSingleCategoryScreen extends StatefulWidget {
  const ViewSingleCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ViewSingleCategoryScreen> createState() =>
      _ViewSingleCategoryScreenState();
}

class _ViewSingleCategoryScreenState extends State<ViewSingleCategoryScreen> {
  final Category category = Get.arguments;

  @override
  initState() {
    super.initState();
    final controller = Get.find<ViewSingleCategoryController>();
    controller.getCategoryId(id: category.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<ViewSingleCategoryController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                title: CustomTextView(
                    text: category.name,
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
                      controller: controller.categoryProductListController,
                      itemCount: controller.allProductOfCategory.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Obx(() => ProductViewItem(
                              productItem: controller.allProductOfCategory[index],
                              onTap: () {
                                Get.toNamed(AppRoutes.viewProductScreen,
                                    arguments:
                                        controller.allProductOfCategory[index]);
                              },
                              onSave: () {
                                controller.likedProduct(controller.allProductOfCategory[index]);
                              },
                              isLiked: controller.likedProductList.contains(controller.allProductOfCategory[index].id) ? true : false,
                            ),
                        );
                      }),
                ),
              )));
    });
  }
}
