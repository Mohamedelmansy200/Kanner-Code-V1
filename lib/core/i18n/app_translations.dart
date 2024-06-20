import 'package:get/get.dart';

part 'languages/ar.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'ar': _ar};
}
