import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/model/product/product_item.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/view_product/color_selector.dart';
import 'package:platzi_fake_store/view/components/widget/view_product/custom_product_count.dart';
import 'package:platzi_fake_store/view/components/widget/view_product/custom_product_footer.dart';
import 'package:platzi_fake_store/view/components/widget/view_product/custom_product_rate.dart';
import 'package:platzi_fake_store/view/components/widget/view_product/size_selector.dart';
import 'package:platzi_fake_store/view/page/view_product_screen/view_product_controller/view_product_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({Key? key}) : super(key: key);

  ProductItem get item => Get.arguments;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<ViewProductController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
            body: CustomScrollView(physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    expandedHeight: SizeConfig.height! * 0.4,
                    collapsedHeight: SizeConfig.height! * 0.4,
                    iconTheme: const IconThemeData(color: Colors.black),
                    flexibleSpace: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                  height: SizeConfig.height! * 0.4,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: false,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                  const Duration(seconds: 2),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: controller.onImageChange),
                              items: item.images?.map((item) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Image.network(
                                      item,
                                      width: SizeConfig.width,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            Positioned(
                              bottom: 10,
                              child: AnimatedSmoothIndicator(
                                activeIndex: controller.activeIndex.value,
                                count: item.images?.length ?? 1,
                                duration: const Duration(microseconds: 500),
                                effect: const ExpandingDotsEffect(
                                    dotWidth: 5, dotHeight: 5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextView(
                                text: item.title,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              Obx(
                                    () =>
                                    IconButton(
                                        onPressed: controller.likedProduct,
                                        color: Colors.black,
                                        icon: controller.isLikedProduct.isFalse
                                            ? const Icon(
                                          Icons.favorite_outline_sharp,
                                          color: Colors.black,
                                          size: 20,
                                        )
                                            : const Icon(
                                          Icons.favorite_outlined,
                                          color: Colors.black,
                                          size: 20,
                                        )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const CustomProductRate(
                            sell: 7.5,
                            rate: 4.5,
                            reviews: 50034,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          const CustomTextView(
                              text: 'Description',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomTextView(
                              text: item.description,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade800),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomTextView(
                                        text: 'Size',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    SizeSelector(
                                      availableSizes: controller.availableSizes,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomTextView(
                                        text: 'Color',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    ColorSelector(
                                      availableColors: controller
                                          .availableColors,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Obx(() {
                            return CustomProductCount(
                              countNumber: controller.productQuantity.value,
                              remove: controller.decreaseQuantity,
                              add: controller.increaseQuantity,
                            );
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(() {
                            return CustomProductFooter(
                              price: item.price *
                                  controller.productQuantity.value,
                              addCart: () {
                                controller.addProductToCart(item);
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ]),
          ));
    });
  }
}
