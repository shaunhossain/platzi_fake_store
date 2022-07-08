import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/profile/custom_profile_action_button.dart';
import 'package:platzi_fake_store/view/page/profile_screen/profile_controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  elevation: 0.3,
                  leading: Center(
                    child: CustomTextView(
                        text: "Profile",
                        fontSize: SizeConfig.textScaleFactor! * 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  leadingWidth: SizeConfig.width,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.black,
                        )),
                  ],
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: SizeConfig.width! * 0.3,
                            height: SizeConfig.width! * 0.3,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Card(
                              elevation: 1,
                              shape: const StadiumBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                              child: ClipOval(
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScXyoZXpAWph9Vnu9_ZpWgNmn20W4hlBOn-5dLmFQuww8zSfnhRRNQW7B0RRuApO_PFwg&usqp=CAU',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 6,
                            right: 10,
                            child: GestureDetector(
                              onTap: () async {},
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.black),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CustomTextView(
                          text: 'Andrew Ansley',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomTextView(
                          text: 'andrew_ansley@gmail.com',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: SizeConfig.width,
                        height: 0.5,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        CustomProfileActionButton(
                          leadIcon: Icons.person_outline_rounded,
                          title: 'Edit Profile',
                          actionWidget: const Icon(Icons.arrow_forward_ios),
                          onTap: () {},
                          color: Colors.black,
                        ),
                        CustomProfileActionButton(
                            leadIcon: Icons.location_on_outlined,
                            title: 'Address',
                            actionWidget: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                            color: Colors.black),
                        CustomProfileActionButton(
                            leadIcon: Icons.notification_important_outlined,
                            title: 'Notification',
                            actionWidget: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                            color: Colors.black),
                        CustomProfileActionButton(
                            leadIcon: Icons.payment_rounded,
                            title: 'Payment',
                            actionWidget: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                            color: Colors.black),
                        CustomProfileActionButton(
                            leadIcon: Icons.security_rounded,
                            title: 'Security',
                            actionWidget: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                            color: Colors.black),
                        CustomProfileActionButton(
                            leadIcon: Icons.language_rounded,
                            title: 'Language',
                            actionWidget: Row(
                              children: const [
                                CustomTextView(text: 'English (US)', color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500,),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                            onTap: () {},
                            color: Colors.black),
                        CustomProfileActionButton(
                            leadIcon: Icons.remove_red_eye_outlined,
                            title: 'Dark Mode',
                            actionWidget: FlutterSwitch(
                              width: 50.0,
                              height: 26.0,
                              valueFontSize: 12.0,
                              toggleSize: 24.0,
                              value: true,
                              borderRadius: 16.0,
                              onToggle: (val) {},
                            ),
                            onTap: () {},
                            color: Colors.black),
                        CustomProfileActionButton(
                            leadIcon: Icons.lock_outline_rounded,
                            title: 'Privacy',
                            actionWidget: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                            color: Colors.black),
                        CustomProfileActionButton(
                            leadIcon: Icons.help_outline_rounded,
                            title: 'Help Center',
                            actionWidget: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                            color: Colors.black),
                        CustomProfileActionButton(
                            leadIcon: Icons.groups_rounded,
                            title: 'Invite Friends',
                            actionWidget: const Icon(Icons.arrow_forward_ios),
                            onTap: () {},
                            color: Colors.black),
                        CustomProfileActionButton(
                            leadIcon: Icons.logout_rounded,
                            title: 'Logout',
                            actionWidget: const SizedBox(),
                            onTap: () {},
                            color: Colors.redAccent),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
