import 'camera_page_controller.dart';
import 'package:get/get.dart';

final class CameraPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CameraPageController>(CameraPageController());
  }
}
