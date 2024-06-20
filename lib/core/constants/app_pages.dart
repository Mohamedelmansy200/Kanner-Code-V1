import 'package:bot/pages/close/close_page.dart';

import '../../pages/camera/camera_page.dart';
import '../../pages/camera/camera_page_bindings.dart';
import '../../pages/home/home_page.dart';
import '../../pages/home/home_page_bindings.dart';
import '../../pages/register/register_page.dart';
import '../../pages/register/register_page_bindings.dart';
import 'package:get/get.dart';

import '../../pages/splash/splash_page.dart';
import '../../pages/splash/splash_page_bindings.dart';
import 'app_routes.dart';

final class AppPages {
  AppPages._();

  static final List<GetPage> list = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      binding: SplashPageBindings(),
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.camera,
      binding: CameraPageBindings(),
      page: () => const CameraPage(),
    ),
    GetPage(
      name: AppRoutes.register,
      binding: RegisterPageBindings(),
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.close,
      page: () => const ClosePage(),
    ),
    GetPage(
      name: AppRoutes.home,
      binding: HomePageBindings(),
      page: () => const HomePage(),
    ),
  ];
}
