import '../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'splash_page_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: controller.playIntro,
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: ColoredBox(
            color: AppColors.primary,
            child: FractionallySizedBox(
              heightFactor: 0.5,
              widthFactor: 0.5,
              child: SvgPicture.asset('assets/smile.svg'),
            ),
          ),
        ),
      ),
    );
  }
}
