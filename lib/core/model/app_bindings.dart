import '../services/data_service.dart';
import '../../services/get_connect_api_service.dart';
import 'package:get/get.dart';

final class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<DataService>(GetConnectDataService());
  }
}
