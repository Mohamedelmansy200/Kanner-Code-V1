import '../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_controller.dart';

enum ProjectCategory { games, education, entertainment }

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <(ProjectCategory, Color)>[
          (ProjectCategory.games, AppColors.primary),
          (ProjectCategory.education, AppColors.error),
          (ProjectCategory.entertainment, AppColors.warning),
        ].map<Widget>(
          (record) {
            return Expanded(
              child: GestureDetector(
                onTap: () => controller.openCategoryDialog(record.$1),
                child: ColoredBox(
                  color: record.$2,
                  child: Center(
                    child: Text(
                      record.$1.name.tr,
                      style: context.textTheme.displayMedium?.copyWith(
                        color: AppColors.background,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
