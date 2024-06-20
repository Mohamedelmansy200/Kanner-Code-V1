import '../../core/services/data_service.dart';
import 'package:get/get.dart';

import 'register_page_controller.dart';

final class RegisterPageBindings extends Bindings {
  @override
  void dependencies() {
    final DataService dataService = Get.find<DataService>();
    final RegisterPageController controller = RegisterPageController(dataService: dataService);
    Get.put<RegisterPageController>(controller);
  }
}
