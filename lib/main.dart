import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/strings.dart';
import 'package:platzi_fake_store/view/components/themes/themes.dart';
import 'package:platzi_fake_store/view/services/initial_binding/initial_binding.dart';
import 'package:platzi_fake_store/view/services/theme_service/theme_service.dart';
import 'view/components/navigator/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      initialBinding: InitialBinding(),
      initialRoute: '/start-up-screen',
      getPages: AppPages.list,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
    );
  }
}

