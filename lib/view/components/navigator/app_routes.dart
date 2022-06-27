import 'package:get/get.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';


class AppPages {
  static var list = [

    GetPage(
        name: AppRoutes.splashScreen,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: AppRoutes.loginPage,
        page: () => const LoginPage(),
        binding: LoginBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: AppRoutes.signUpPage,
        page: () => const SignUpPage(),
        binding: SignUpBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.forgetPasswordPage,
        page: () => const ForgetPasswordPage(),
        binding: ForgetPasswordBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.resetPasswordPage,
        page: () => const ResetPasswordPage(),
        binding: ResetPasswordPageBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.verificationPage,
        page: () => const VerificationPage(),
        binding: VerificationPageBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.mainScreen,
        page: () => const MainViewScreen(),
        binding: MainScreenBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.homePage,
        page: () => const HomePage(),
        binding: MainScreenBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.dashboardPage,
        page: () => const DashBoardPage(),
        binding: MainScreenBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.profilePage,
        page: () => const ProfilePage(),
        binding: MainScreenBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.editProfilePage,
        page: () =>  const EditProfilePage(),
        binding: EditProfileBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.notificationPage,
        page: () => const NotificationPage(),
        binding: MainScreenBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.habitsPage,
        page: () => const HabitPage(),
        binding: HabitBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.habitsDetailsPage,
        page: () => const HabitDetailsPage(),
        binding: HabitDetailsBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.createHabitPage,
        page: () => const CreateHabit(),
        binding: CreateHabitBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.challengePage,
        page: () => const ChallengePage(),
        //binding: MainScreenBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.todoPage,
        page: () => const TodoPage(),
        binding: TodoBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.billboardPage,
        page: () => const BillBoardPage(),
        binding: BillBoardBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.showBillboardDetailsPage,
        page: () => const BillboardDetailsPage(),
        binding: BillBoardDetailsBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.createBillboardPage,
        page: () => const CreateBillBoardPage(),
        binding: CreateBillBoardBinding(),
        transition: Transition.rightToLeft),

  ];
}
