import 'package:flutter/material.dart';
import 'package:platzi_fake_store/db/db_model/add_cart_product.dart';
import 'package:platzi_fake_store/utils/conversion.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.item, required this.deleteItem})
      : super(key: key);
  final AddCartProduct item;
  final Function() deleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(30)),
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
                  IconButton(
                      onPressed: deleteItem,
                      icon: const Icon(Icons.delete_outline))
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
                        shape: BoxShape.circle, color: Color(item.color)),
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
                    width: SizeConfig.width! * 0.25,
                    height: SizeConfig.height! * 0.04,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                            child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove,
                            size: 13,
                          ),
                          padding: EdgeInsets.zero,
                        )),
                        CustomTextView(
                            text: '${item.quantity}',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        FittedBox(
                            child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 13,
                          ),
                          padding: EdgeInsets.zero,
                        ))
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
