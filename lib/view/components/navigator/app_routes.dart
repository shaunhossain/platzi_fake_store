import 'package:get/get.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';
import 'package:platzi_fake_store/view/page/auth/login_screen/login_binding/login_binding.dart';
import 'package:platzi_fake_store/view/page/auth/login_screen/login_screen.dart';
import 'package:platzi_fake_store/view/page/auth/sign_up_screen/sign_up_binding/sign_up_binding.dart';
import 'package:platzi_fake_store/view/page/auth/sign_up_screen/sign_up_screen.dart';
import 'package:platzi_fake_store/view/page/auth/start_up_screen/start_up_binding/start_up_binding.dart';
import 'package:platzi_fake_store/view/page/auth/start_up_screen/start_up_screen.dart';
import 'package:platzi_fake_store/view/page/cart_screen/cart_screen.dart';
import 'package:platzi_fake_store/view/page/edit_profile_screen/edit_profile_binding/edit_profile_binding.dart';
import 'package:platzi_fake_store/view/page/edit_profile_screen/edit_profile_screen.dart';
import 'package:platzi_fake_store/view/page/home_screen/home_screen.dart';
import 'package:platzi_fake_store/view/page/main_screen/main_binding/main_binding.dart';
import 'package:platzi_fake_store/view/page/main_screen/main_screen.dart';
import 'package:platzi_fake_store/view/page/my_wishlist_screen/my_wishlist_binding/my_wishlist_binding.dart';
import 'package:platzi_fake_store/view/page/my_wishlist_screen/my_wishlist_screen.dart';
import 'package:platzi_fake_store/view/page/notification_screen/notification_binding/notification_binding.dart';
import 'package:platzi_fake_store/view/page/notification_screen/notification_screen.dart';
import 'package:platzi_fake_store/view/page/order_screen/order_screen.dart';
import 'package:platzi_fake_store/view/page/profile_screen/profile_screen.dart';
import 'package:platzi_fake_store/view/page/splash_screen/splash_binding/splash_binding.dart';
import 'package:platzi_fake_store/view/page/splash_screen/splash_screen.dart';
import 'package:platzi_fake_store/view/page/wallet_screen/wallet_screen.dart';


class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.splashScreen,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: AppRoutes.startUpScreen,
        page: () => const StartUpScreen(),
        binding: StartUpBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.loginScreen,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: AppRoutes.signUpScreen,
        page: () => const SignUpScreen(),
        binding: SignUpBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: AppRoutes.mainScreen,
        page: () => const MainScreen(),
        binding: MainBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.homeScreen,
        page: () => const HomeScreen(),
        binding: MainBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.notificationScreen,
        page: () => const NotificationScreen(),
        binding: NotificationBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.myWishlistScreen,
        page: () => const MyWishlistScreen(),
        binding: MyWishlistBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.cartScreen,
        page: () => const CartScreen(),
        binding: MainBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.profileScreen,
        page: () => const ProfileScreen(),
        binding: MainBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.editProfileScreen,
        page: () => const EditProfileScreen(),
        binding: EditProfileBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.orderScreen,
        page: () =>  const OrderScreen(),
        binding: MainBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.walletScreen,
        page: () => const WalletScreen(),
        binding: MainBinding(),
        transition: Transition.rightToLeft),

  ];
}
