import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/colors.dart';
import 'package:platzi_fake_store/view/components/bottom_navbar/bottom_nav_bar_item.dart';
import 'package:platzi_fake_store/view/components/bottom_navbar/custom_animated_bottom_bar.dart';
import 'package:platzi_fake_store/view/page/cart_screen/cart_screen.dart';
import 'package:platzi_fake_store/view/page/home_screen/home_screen.dart';
import 'package:platzi_fake_store/view/page/main_screen/main_controller/main_controller.dart';
import 'package:platzi_fake_store/view/page/order_screen/order_screen.dart';
import 'package:platzi_fake_store/view/page/profile_screen/profile_screen.dart';
import 'package:platzi_fake_store/view/page/wallet_screen/wallet_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller){
      return Scaffold(
        body: SafeArea(
          child: PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.pageChanged(index);
            },
            children:  const [
              HomeScreen(),
              CartScreen(),
              OrderScreen(),
              WalletScreen(),
              ProfileScreen()
            ],
          ),
        ),
        bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight: 60,
          backgroundColor: Colors.white,
          selectedIndex: controller.pageIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: controller.selectNavItem,
          items: <BottomNavBarItem>[
            BottomNavBarItem(
              icon: const Icon(Icons.home_rounded),
              title: const Text('Home'),
              activeColor: Colors.green,
              inactiveColor: inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: const Text('DashBoard'),
              activeColor: Colors.purpleAccent,
              inactiveColor: inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavBarItem(
              icon: const Icon(Icons.shopping_bag),
              title: const Text(
                'Notification ',
              ),
              activeColor: Colors.pink,
              inactiveColor: inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavBarItem(
              icon: const Icon(Icons.wallet),
              title: const Text(
                'Notification ',
              ),
              activeColor: Colors.amberAccent,
              inactiveColor: inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Settings'),
              activeColor: Colors.blue,
              inactiveColor: inactiveColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }
}
