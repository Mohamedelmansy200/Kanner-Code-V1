import '../model/registration_data.dart';

enum DataServiceException {
  invalidAge,
  invalidName,
  invalidEmail,
  unknownError,
  invalidPassword,
  emailAlreadyExists,
  invalidPhoneNumber,
}

abstract interface class DataService {
  Future<void> register(RegistrationData data);
}
