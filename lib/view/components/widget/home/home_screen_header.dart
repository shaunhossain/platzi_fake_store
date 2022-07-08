import 'package:flutter/material.dart';
import 'package:platzi_fake_store/model/profile/profile.dart';
import 'package:platzi_fake_store/utils/endpoint.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader(
      {Key? key,
      required this.onTapProfilePhoto,
      required this.onPressNotificationButton,
      required this.onPressWishList,
      required this.profileInfo})
      : super(key: key);
  final Profile profileInfo;
  final Function() onTapProfilePhoto;
  final Function() onPressNotificationButton;
  final Function() onPressWishList;

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
              child: InkWell(
                focusColor: Colors.black,
                hoverColor: Colors.black,
                radius: 15,
                borderRadius: BorderRadius.circular(60),
                onTap: onTapProfilePhoto,
                child: Card(
                  elevation: 0.1,
                  shape: const StadiumBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  child: ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                       profileInfo.avatar,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.network(demoProfilePic);
                        },
                      ),),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextView(
                  text: 'Good Morning',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                CustomTextView(
                  text: profileInfo.name,
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
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.grey.shade700,
                  size: 22,
                ),
                padding: EdgeInsets.zero,
                onPressed: onPressNotificationButton,
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.grey.shade700,
                  size: 22,
                ),
                padding: EdgeInsets.zero,
                onPressed: onPressWishList,
              )
            ],
          ),
        )
      ],
    );
  }
}
