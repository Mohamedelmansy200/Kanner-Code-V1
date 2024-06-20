import '../../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecognitionResult extends StatelessWidget {
  final bool isAutistic;
  final bool isRecognized;

  const RecognitionResult({
    required this.isAutistic,
    required this.isRecognized,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: (isRecognized || !isAutistic) ? AppColors.success : AppColors.error,
      ),
      child: Text(
        isAutistic ? (isRecognized ? 'recognized'.tr : 'unRecognized'.tr) : 'non-autistic'.tr,
        style: context.textTheme.bodyLarge?.copyWith(
          color: AppColors.background,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
