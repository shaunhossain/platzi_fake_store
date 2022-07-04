import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';
import 'package:platzi_fake_store/view/components/widget/home/custom_category_button.dart';
import 'package:platzi_fake_store/view/components/widget/home/custom_category_item.dart';
import 'package:platzi_fake_store/view/components/widget/home/custom_search_field.dart';
import 'package:platzi_fake_store/view/components/widget/home/home_screen_header.dart';
import 'package:platzi_fake_store/view/components/widget/home/custom_text_span_button.dart';
import 'package:platzi_fake_store/view/components/widget/home/offer_item.dart';
import 'package:platzi_fake_store/view/components/widget/home/product_view_item.dart';
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
                    expandedHeight: SizeConfig.height!*0.18,
                    collapsedHeight: SizeConfig.height!*0.18,
                    flexibleSpace: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeScreenHeader(onTapProfilePhoto: () {
                          Get.toNamed(AppRoutes.editProfileScreen);
                        }, onPressNotificationButton: () {
                          Get.toNamed(AppRoutes.notificationScreen);
                        }, onPressWishList: () {
                          Get.toNamed(AppRoutes.myWishlistScreen);
                        },),
                        CustomSearchField(
                          spacing: 0,
                          hint: 'Search',
                          onTap: () {
                            Get.toNamed(AppRoutes.searchProductScreen);
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
                          onPress: () {
                            Get.toNamed(AppRoutes.specialOfferScreen);
                          },
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
                              items: controller.offerList.map((item) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return OfferItem(offerDetails: item,);
                                  },
                                );
                              }).toList(),
                            ),
                            Positioned(
                              bottom: 10,
                              child: AnimatedSmoothIndicator(
                                activeIndex: controller.activeIndex.value,
                                count: controller.offerList.length,
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
                            onTap: () {
                              Get.toNamed(AppRoutes.viewSingleCategoryScreen);
                            });
                      },
                      childCount: controller.productCategory.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.89,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTextSpanButton(
                      title: 'Most Popular',
                      seeMore: 'See All',
                      onPress: () {
                        Get.toNamed(AppRoutes.mostPopularScreen);
                      },
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
                                        Get.toNamed(AppRoutes.viewSingleCategoryScreen);
                                      },
                                    )))
                                .toList(),
                          ))),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ProductViewItem(productItem: controller.allProduct[index], onTap: () {
                          Get.toNamed(AppRoutes.viewProductScreen);
                        },);
                      },
                      childCount: controller.allProduct.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.79,
                    ),
                  ),
                ]),
          ),
        ),
      );
    });
  }
}
