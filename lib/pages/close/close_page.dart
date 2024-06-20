import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_elevated_button.dart';

class ClosePage extends StatelessWidget {
  const ClosePage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.displayMedium;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'non-autistic'.tr,
              style: style?.copyWith(color: AppColors.success),
            ),
            const SizedBox(height: 32),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: AppElevatedButton(
                title: 'close'.tr,
                onTap: windowManager.close,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
