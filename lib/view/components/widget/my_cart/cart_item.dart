import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30)),
      child: Container(
        margin: const EdgeInsets.only(left: 12,top: 12,bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  'https://cdn.lorem.space/images/fashion/.cache/640x480/thought-catalog-mPE2I7afQiw-unsplash.jpg',
                  fit: BoxFit.fitWidth,
                ),),
            ),
            SizedBox(width: SizeConfig.width! * 0.01,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: SizeConfig.width! * 0.34,
                      child: const CustomTextView(
                          text: 'Long',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(width: SizeConfig.width! * 0.02,),
                    const CustomTextView(
                        text: 'color',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                    SizedBox(width: SizeConfig.width! * 0.02,),
                    const CustomTextView(
                        text: '|',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                    SizedBox(width: SizeConfig.width! * 0.02,),
                    const CustomTextView(
                        text: 'size = M',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextView(
                        text: '\u0024356',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    SizedBox(width: SizeConfig.width! * 0.05,),
                    Container(
                      width: SizeConfig.width! * 0.26,
                      height: SizeConfig.height! * 0.04,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.remove,size: 13,),padding: EdgeInsets.zero,),
                          const CustomTextView(
                              text: '1',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.add,size: 13,),padding: EdgeInsets.zero,)
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
