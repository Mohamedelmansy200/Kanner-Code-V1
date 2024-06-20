import '../core/model/registration_data.dart';
import '../core/services/data_service.dart';
import 'package:get/get.dart';

final class GetConnectDataService extends GetConnect implements DataService {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://authintcation-authorization-system-1.onrender.com/api';
    super.onInit();
  }

  @override
  Future<void> register(RegistrationData data) async {
    try {
      final Response response = await httpClient.post(
        '/auth/signup',
        headers: {'name': 'ahmed'},
        body: {
          "age": data.age,
          "name": data.name,
          "email": data.email,
          "password": data.password,
          "phoneNumber": data.phoneNumber,
          "passwordConfirm": data.password,
        },
      );
      if (!response.isOk) throw DataServiceException.unknownError;
    } catch (e) {
      if (e is DataServiceException) rethrow;
      throw DataServiceException.unknownError;
    }
  }
}
