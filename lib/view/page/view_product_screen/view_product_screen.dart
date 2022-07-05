import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/model/product/product_item.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/view_product/color_selector.dart';
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
            //controller: controller.productController,
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
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 24),
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
                          const Icon(
                            Icons.favorite_outline_sharp,
                            color: Colors.black,
                            size: 20,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            width: SizeConfig.width! * 0.2,
                            height: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5)),
                            child: const CustomTextView(
                                text: '6.5 sold',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 3),
                                child: Icon(
                                  Icons.star_half_rounded,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                              CustomTextView(
                                  text: '4.5 (50034 reviews)',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: SizeConfig.width,
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
                      const CustomTextView(
                          text: 'Color',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      ColorSelector(
                        availableColors: [Color(0xFFDB3022),Color(0xFF2AA952),Color(0xFF9B9B9B)],
                        selectedColors: [Color(0xFFDB3022),Color(0xFF2AA952),Color(0xFF9B9B9B)],
                        label: "select color",
                        onClick: (newColor){

                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomTextView(
                              text: 'Quality',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: SizeConfig.width! * 0.35,
                            height: SizeConfig.height! * 0.05,
                            decoration: ShapeDecoration(
                              color: Colors.grey.shade300,
                              shape: const StadiumBorder(),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(onPressed: (){},color: Colors.black,icon: const Icon(Icons.remove,size: 16,),),
                                const CustomTextView(
                                    text: '2',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                IconButton(onPressed: (){},color: Colors.black,icon: const Icon(Icons.add,size: 16,),)
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: SizeConfig.width,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ));
    });
  }
}
