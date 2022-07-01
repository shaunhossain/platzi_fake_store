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
import 'package:platzi_fake_store/view/page/home_screen/home_controller/home_controller.dart';

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
                controller: controller.productController,
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    const HomeScreenHeader(),
                    CustomSearchField(
                      spacing: 10,
                      userInput: TextEditingController(),
                      hint: 'Search',
                      onTap: () {
                        showSearchFilter();
                      },
                    ),
                    CustomTextSpanButton(
                      title: 'Special Offer',
                      seeMore: 'See All',
                      onPress: () {},
                    ),
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
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: SizeConfig.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Text(
                                  'text $i',
                                  style: const TextStyle(fontSize: 16.0),
                                )));
                          },
                        );
                      }).toList(),
                    ),
                    Obx(
                      () => Container(
                        height: SizeConfig.height! * 0.28,
                        padding: const EdgeInsets.only(top: 20),
                        child: GridView.count(
                          crossAxisCount: 4,
                          children: controller.productCategory
                              .map((item) => CustomCategoryItem(
                                  title: item.name,
                                  icon: item.icon,
                                  onTap: () {}))
                              .toList(),
                        ),
                      ),
                    ),
                    CustomTextSpanButton(
                      title: 'Most Popular',
                      seeMore: 'See All',
                      onPress: () {},
                    ),
                    Obx(
                      () => SizedBox(
                          height: SizeConfig.height! * 0.07,
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
                                        controller.isButtonPress.value = !controller.isButtonPress.value;
                                      },
                                    )))
                                .toList(),
                          )),
                    ),
                  ]))
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
