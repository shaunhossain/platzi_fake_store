import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/utils/store_user_sessions/store_user_sessions.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';
import 'package:platzi_fake_store/view/components/widget/home/custom_category_button.dart';
import 'package:platzi_fake_store/view/components/widget/home/custom_category_item.dart';
import 'package:platzi_fake_store/view/components/widget/home/custom_search_field.dart';
import 'package:platzi_fake_store/view/components/widget/home/home_screen_header.dart';
import 'package:platzi_fake_store/view/components/widget/home/custom_text_span_button.dart';
import 'package:platzi_fake_store/view/components/widget/home/product_item.dart';
import 'package:platzi_fake_store/view/page/home_screen/home_controller/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                controller: controller.productController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    expandedHeight: SizeConfig.height!*0.2,
                    collapsedHeight: SizeConfig.height!*0.2,
                    flexibleSpace: Column(
                      children: [
                        const HomeScreenHeader(),
                        CustomSearchField(
                          spacing: 10,
                          userInput: TextEditingController(),
                          hint: 'Search',
                          onTap: () {
                            showSearchFilter();
                          },
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        CustomTextSpanButton(
                          title: 'Special Offer',
                          seeMore: 'See All',
                          onPress: () {},
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                  height: 150,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      const Duration(seconds: 2),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: controller.onPageChange),
                              items: [1, 2, 3, 4, 5].map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                        width: SizeConfig.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Center(
                                            child: Text(
                                          'text $i',
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                        )));
                                  },
                                );
                              }).toList(),
                            ),
                            Positioned(
                              bottom: 10,
                              child: AnimatedSmoothIndicator(
                                activeIndex: controller.activeIndex.value,
                                count: 5,
                                duration: const Duration(microseconds: 500),
                                effect: const ExpandingDotsEffect(
                                  dotWidth: 5,
                                  dotHeight: 5
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CustomCategoryItem(
                            title: controller.productCategory[index].name,
                            icon: controller.productCategory[index].icon,
                            onTap: () {});
                      },
                      childCount: controller.productCategory.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.0,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTextSpanButton(
                      title: 'Most Popular',
                      seeMore: 'See All',
                      onPress: () {},
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                          height: SizeConfig.height! * 0.1,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: controller.productCategory
                                .map((item) => FittedBox(
                                        child: CustomCategoryButton(
                                      title: item.name,
                                      textColor: Colors.black,
                                      padding: 10,
                                      buttonColor: Colors.white,
                                      onPress: () {
                                        controller.isButtonPress.value =
                                            !controller.isButtonPress.value;
                                      },
                                    )))
                                .toList(),
                          ))),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return const ProductItem(title: 'title', point: "12");
                      },
                      childCount: 50,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.0,
                    ),
                  ),
                ]),
          ),
        ),
      );
    });
  }

  /// BOTTOM SHEET
  showSearchFilter() {
    Get.bottomSheet(
      Container(
        height: 330,
        padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
        child: Column(
          children: [
            CustomCategoryItem(
              title: 'Edit Profile',
              icon: 'assets/shoes',
              onTap: () {
                Future.delayed(Duration.zero, () {
                  Get.back();
                }).then((value) {
                  Get.toNamed('/edit-profile-page');
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomCategoryItem(
              title: 'Archive',
              icon: 'assets/shoes',
              onTap: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            CustomCategoryItem(
              title: 'Invite Friends',
              icon: 'assets/shoes',
              onTap: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            CustomCategoryItem(
              title: 'Settings',
              icon: 'assets/shoes',
              onTap: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            CustomCategoryItem(
              title: 'Log Out',
              icon: 'assets/shoes',
              onTap: () {
                final storage = StoreUserSessions();
                storage.deleteAllInfo();
                Get.toNamed(AppRoutes.startUpScreen);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
