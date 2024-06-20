import '../../core/model/registration_data.dart';
import '../../core/services/data_service.dart';
import '../../core/utils/app_functions.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/constants/app_routes.dart';

final class RegisterPageController extends GetxController {
  final DataService dataService;

  RegisterPageController({required this.dataService});

  late final GlobalKey<FormState> formKey;

  late final TextEditingController emailController;
  late final TextEditingController nameController;
  late final TextEditingController passwordController;
  late final TextEditingController passwordConfirmationController;
  late final TextEditingController ageController;
  late final TextEditingController phoneNumberController;

  late final FocusNode emailFocusNode;
  late final FocusNode nameFocusNode;
  late final FocusNode passwordFocusNode;
  late final FocusNode passwordConfirmationFocusNode;
  late final FocusNode ageFocusNode;
  late final FocusNode phoneNumberFocusNode;

  late final RxBool isRegistering;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    isRegistering = false.obs;
    _initControllers();
    _initFocusNodes();
    super.onInit();
  }

  void _initControllers() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    ageController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  void _initFocusNodes() {
    emailFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    passwordConfirmationFocusNode = FocusNode();
    ageFocusNode = FocusNode();
    phoneNumberFocusNode = FocusNode();
  }

  Future<void> register() async {
    try {
      if (!formKey.currentState!.validate()) return;
      isRegistering.value = true;
      final RegistrationData data = RegistrationData(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
        age: int.parse(ageController.text),
        phoneNumber: phoneNumberController.text,
      );
      await dataService.register(data);
      isRegistering.value = false;
      Get.offNamed(AppRoutes.home);
    } catch (e) {
      isRegistering.value = false;
      final String message = DataServiceException.unknownError.name;
      AppFunctions.showSnackBar(message: message.tr);
    }
  }

  @override
  void onClose() {
    _disposeControllers();
    _disposeFocusNodes();
    super.onClose();
  }

  void _disposeControllers() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    ageController.dispose();
    phoneNumberController.dispose();
  }

  void _disposeFocusNodes() {
    emailFocusNode.dispose();
    nameFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordConfirmationFocusNode.dispose();
    ageFocusNode.dispose();
    phoneNumberFocusNode.dispose();
  }
}
