import 'splash_page_controller.dart';
import 'package:get/get.dart';

final class SplashPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashPageController>(SplashPageController());
  }
}
