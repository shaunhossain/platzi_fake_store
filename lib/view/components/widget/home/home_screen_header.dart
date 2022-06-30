import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: SizeConfig.width! * 0.16,
              height: SizeConfig.width! * 0.16,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Card(
                elevation: 0.1,
                shape:  const StadiumBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 1.5,
                  ),
                ),
                child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset('assets/profile.jpeg')
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomTextView(
                  text: 'Good Morning',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                CustomTextView(
                  text: 'Andrew Ansley',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          width: SizeConfig.width! * 0.28,
          //color: Colors.blueAccent,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_active_outlined,color: Colors.grey.shade700,size: 22,),
                padding: EdgeInsets.zero,
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.favorite_border,color: Colors.grey.shade700,size: 22,),
                padding: EdgeInsets.zero,
                onPressed: (){},
              )
            ],
          ),
        )
      ],
    );
  }
}
