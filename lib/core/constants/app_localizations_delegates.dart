import 'package:flutter_localizations/flutter_localizations.dart';

final class AppLocalizationsDelegates {
  AppLocalizationsDelegates._();

  static const list = [
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    ...GlobalMaterialLocalizations.delegates,
  ];
}
