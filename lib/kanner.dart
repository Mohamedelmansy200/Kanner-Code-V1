import 'core/constants/app_colors.dart';
import 'core/constants/app_locales.dart';
import 'core/constants/app_localizations_delegates.dart';
import 'core/constants/app_pages.dart';
import 'core/constants/app_themes.dart';
import 'core/i18n/app_translations.dart';
import 'core/model/app_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import 'core/constants/app_routes.dart';

class Kanner extends StatelessWidget {
  const Kanner({super.key});

  @override
  Widget build(BuildContext context) {
    final Locale firstLocale = AppLocales.list.first;
    return GetMaterialApp(
      locale: firstLocale,
      theme: AppThemes.light,
      getPages: AppPages.list,
      themeMode: ThemeMode.light,
      fallbackLocale: firstLocale,
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.splash,
      translations: AppTranslations(),
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocales.list,
      localizationsDelegates: AppLocalizationsDelegates.list,
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            if (child != null) child,
            Positioned(
              right: 16,
              top: 16,
              child: IconButton(
                onPressed: windowManager.close,
                icon: const Icon(
                  Icons.close,
                  color: AppColors.error,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
