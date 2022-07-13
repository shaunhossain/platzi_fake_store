import 'package:flutter/material.dart';
import 'package:platzi_fake_store/db/db_model/add_cart_product.dart';
import 'package:platzi_fake_store/utils/conversion.dart';
import 'package:platzi_fake_store/utils/endpoint.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomProductView extends StatelessWidget {
  const CustomProductView({Key? key, required this.item}) : super(key: key);
  final AddCartProduct item;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: SizeConfig.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              color: Colors.white,
              height: SizeConfig.width! * 0.26,
              width: SizeConfig.width! * 0.345,
              alignment: Alignment.center,
              child: Image.network(
                Conversion().imageUrl(images: item.images).first,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: SizeConfig.width! * 0.34,
                    child: CustomTextView(
                        text: item.title,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(item.color)),
                  ),
                  SizedBox(
                    width: SizeConfig.width! * 0.02,
                  ),
                  const CustomTextView(
                      text: 'color',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                  SizedBox(
                    width: SizeConfig.width! * 0.02,
                  ),
                  const CustomTextView(
                      text: '|',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                  SizedBox(
                    width: SizeConfig.width! * 0.02,
                  ),
                  CustomTextView(
                      text: 'size = ${item.size}',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextView(
                      text: '\u0024${item.price}',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  SizedBox(
                    width: SizeConfig.width! * 0.05,
                  ),
                  Container(
                    width: SizeConfig.width! * 0.08,
                    height: SizeConfig.width! * 0.08,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: CustomTextView(
                        text: '${item.quantity}',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
