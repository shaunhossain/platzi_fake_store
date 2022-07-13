import 'package:get/get.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';
import 'package:platzi_fake_store/view/page/auth/login_screen/login_binding/login_binding.dart';
import 'package:platzi_fake_store/view/page/auth/login_screen/login_screen.dart';
import 'package:platzi_fake_store/view/page/auth/sign_up_screen/sign_up_binding/sign_up_binding.dart';
import 'package:platzi_fake_store/view/page/auth/sign_up_screen/sign_up_screen.dart';
import 'package:platzi_fake_store/view/page/auth/start_up_screen/start_up_binding/start_up_binding.dart';
import 'package:platzi_fake_store/view/page/auth/start_up_screen/start_up_screen.dart';
import 'package:platzi_fake_store/view/page/cart_screen/cart_screen.dart';
import 'package:platzi_fake_store/view/page/checkout_screen/checkout_binding/checkout_binding.dart';
import 'package:platzi_fake_store/view/page/checkout_screen/checkout_screen.dart';
import 'package:platzi_fake_store/view/page/edit_profile_screen/edit_profile_binding/edit_profile_binding.dart';
import 'package:platzi_fake_store/view/page/edit_profile_screen/edit_profile_screen.dart';
import 'package:platzi_fake_store/view/page/home_screen/home_screen.dart';
import 'package:platzi_fake_store/view/page/main_screen/main_binding/main_binding.dart';
import 'package:platzi_fake_store/view/page/main_screen/main_screen.dart';
import 'package:platzi_fake_store/view/page/most_popular_screen/most_popular_binding/most_popular_binding.dart';
import 'package:platzi_fake_store/view/page/most_popular_screen/most_popular_screen.dart';
import 'package:platzi_fake_store/view/page/my_wishlist_screen/my_wishlist_binding/my_wishlist_binding.dart';
import 'package:platzi_fake_store/view/page/my_wishlist_screen/my_wishlist_screen.dart';
import 'package:platzi_fake_store/view/page/notification_screen/notification_binding/notification_binding.dart';
import 'package:platzi_fake_store/view/page/notification_screen/notification_screen.dart';
import 'package:platzi_fake_store/view/page/order_screen/order_screen.dart';
import 'package:platzi_fake_store/view/page/profile_screen/profile_screen.dart';
import 'package:platzi_fake_store/view/page/search_product_screen/search_product_binding/search_product_binding.dart';
import 'package:platzi_fake_store/view/page/search_product_screen/search_product_screen.dart';
import 'package:platzi_fake_store/view/page/special_offer_screen/special_offer_binding/special_offer_binding.dart';
import 'package:platzi_fake_store/view/page/special_offer_screen/special_offer_screen.dart';
import 'package:platzi_fake_store/view/page/splash_screen/splash_binding/splash_binding.dart';
import 'package:platzi_fake_store/view/page/splash_screen/splash_screen.dart';
import 'package:platzi_fake_store/view/page/view_product_screen/view_product_binding/view_product_binding.dart';
import 'package:platzi_fake_store/view/page/view_product_screen/view_product_screen.dart';
import 'package:platzi_fake_store/view/page/view_single_carousel_screen/view_single_carousel_screen.dart';
import 'package:platzi_fake_store/view/page/view_single_category_screen/view_single_category_binding/view_single_category_binding.dart';
import 'package:platzi_fake_store/view/page/view_single_category_screen/view_single_category_screen.dart';
import 'package:platzi_fake_store/view/page/wallet_screen/wallet_binding/wallet_binding.dart';
import 'package:platzi_fake_store/view/page/wallet_screen/wallet_screen.dart';
import '../../page/view_single_carousel_screen/view_single_carousel_binding/view_single_carousel_binding.dart';


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
        name: AppRoutes.searchProductScreen,
        page: () => const SearchProductScreen(),
        binding: SearchProductBinding(),
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
        name: AppRoutes.specialOfferScreen,
        page: () => const SpecialOfferScreen(),
        binding: SpecialOfferBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.viewSingleCategoryScreen,
        page: () => const ViewSingleCategoryScreen(),
        binding: ViewSingleCategoryBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.viewSingleCarouselScreen,
        page: () => const ViewSingleCarouselScreen(),
        binding: ViewSingleCarouselBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.mostPopularScreen,
        page: () => const MostPopularScreen(),
        binding: MostPopularBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.viewProductScreen,
        page: () => const ViewProductScreen(),
        binding: ViewProductsBinding(),
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
    GetPage(
        name: AppRoutes.checkoutScreen,
        page: () => const CheckoutScreen(),
        binding: CheckoutBinding(),
        transition: Transition.rightToLeft),

  ];
}
