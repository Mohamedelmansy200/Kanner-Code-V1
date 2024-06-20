import '../constants/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

final class AppFunctions {
  AppFunctions._();

  static void showSnackBar({
    required String message,
    Duration duration = const Duration(seconds: 2),
    bool isError = true,
  }) {
    Get.snackbar(
      isError ? 'error'.tr : 'success'.tr,
      message,
      maxWidth: 600,
      duration: duration,
      colorText: AppColors.text,
      margin: const EdgeInsets.all(16),
      backgroundColor: isError ? AppColors.error : AppColors.success,
    );
  }
}
