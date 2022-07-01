import 'package:flutter/material.dart';
import 'package:platzi_fake_store/model/product/product_item.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view_ellipsis.dart';

class ProductViewItem extends StatelessWidget {
  const ProductViewItem({Key? key, required this.productItem})
      : super(key: key);
  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.grey.shade50,
            elevation: 0.3,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
                color: Colors.blueAccent,
                height: SizeConfig.width! * 0.3,
                width: SizeConfig.width! * 0.4,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Image.network(
                      productItem.images!.first,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                            child: const Icon(Icons.favorite_outline_sharp,color: Colors.white,size: 16,)))
                  ],
                )),
          ),
          const SizedBox(height: 10,),
          CustomTextViewEllipsis(text: productItem.title, fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Icon(Icons.star_half_rounded,color: Colors.black,size: 22,),
              ),
              const CustomTextView(text: '4.5', fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
              const SizedBox(width: 10,),
              Container(
                width: 1,
                height: 14,
                color: Colors.black,
              ),
              const SizedBox(width: 10,),
              Container(
                  width: SizeConfig.width! * 0.15,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)),
                  child: const CustomTextView(text: '6.5 sold', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),)
            ],
          ),
          CustomTextView(text: '\u0024${productItem.price}', fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ],
      ),
    );
  }
}
