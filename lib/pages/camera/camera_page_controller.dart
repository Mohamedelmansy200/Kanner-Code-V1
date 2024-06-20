import 'dart:io';

import 'package:get/get.dart';

import '../../core/constants/app_routes.dart';

final class CameraPageController extends GetxController {
  late final Rxn<File> image;
  late final RxBool isLoading;
  late bool isRecognized;
  late bool isAutistic;
  late RxBool isShowingAutisticResult;

  @override
  void onInit() {
    image = Rxn<File>();
    isLoading = false.obs;
    isAutistic = true;
    isRecognized = false;
    isShowingAutisticResult = false.obs;
    super.onInit();
  }

  Future<void> _delay() async => await Future.delayed(const Duration(seconds: 2));

  void updateImage(String newFilePath, {bool openHomePage = false, bool openClosingPage = false}) async {
    if (image.value == null) {
      image.value = File(newFilePath);
      isLoading.value = true;
      await _delay();
      isLoading.value = false;
      isRecognized = openHomePage;
      isAutistic = !openClosingPage;
      isShowingAutisticResult.value = true;
      await _delay();
      if (openHomePage) {
        Get.offNamed(AppRoutes.home);
      } else if (openClosingPage) {
        Get.offAllNamed(AppRoutes.close);
      } else {
        Get.offNamed(
          AppRoutes.register,
          arguments: image.value,
        );
      }
    }
  }
}
