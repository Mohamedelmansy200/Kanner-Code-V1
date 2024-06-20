import 'dart:io';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_elevated_button.dart';
import 'widgets/authentication_text_field.dart';
import 'widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'register_page_controller.dart';

class RegisterPage extends GetView<RegisterPageController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double width = size.width;
    final double height = size.height;
    final File imageFile = Get.arguments;
    return Scaffold(
      body: Row(
        children: [
          if (width > 1200) const Expanded(child: SideBar()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: width * context.responsiveValue(mobile: 0.9, tablet: 0.6, desktop: 0.3),
                    maxHeight: height * 0.8,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                imageFile,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          AuthenticationTextField(
                            hint: 'name'.tr,
                            obsecure: false,
                            focusNode: controller.nameFocusNode,
                            controller: controller.nameController,
                            onSubmitted: (_) => controller.emailFocusNode.requestFocus(),
                            validator: (value) => value?.isEmpty == true ? 'required'.tr : null,
                          ),
                          AuthenticationTextField(
                            obsecure: false,
                            hint: 'email'.tr,
                            focusNode: controller.emailFocusNode,
                            controller: controller.emailController,
                            onSubmitted: (_) => controller.passwordFocusNode.requestFocus(),
                            validator: (value) {
                              if (value?.isEmpty == true) return 'required'.tr;
                              if (!GetUtils.isEmail(value!)) return 'invalidEmail'.tr;
                              return null;
                            },
                          ),
                          AuthenticationTextField(
                            obsecure: true,
                            hint: 'password'.tr,
                            focusNode: controller.passwordFocusNode,
                            controller: controller.passwordController,
                            onSubmitted: (_) => controller.passwordConfirmationFocusNode.requestFocus(),
                            validator: (value) {
                              if (value?.isEmpty == true) return 'required'.tr;
                              if (value != null && value.length < 6) return 'passwordTooShort'.tr;
                              return null;
                            },
                          ),
                          AuthenticationTextField(
                            obsecure: true,
                            hint: 'passwordConfirmation'.tr,
                            focusNode: controller.passwordConfirmationFocusNode,
                            controller: controller.passwordConfirmationController,
                            onSubmitted: (_) => controller.ageFocusNode.requestFocus(),
                            validator: (value) {
                              if (value?.isEmpty == true) return 'required'.tr;
                              if (value != controller.passwordController.text) return 'passwordsDoNotMatch'.tr;
                              return null;
                            },
                          ),
                          AuthenticationTextField(
                            hint: 'age'.tr,
                            obsecure: false,
                            focusNode: controller.ageFocusNode,
                            controller: controller.ageController,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            onSubmitted: (_) => controller.phoneNumberFocusNode.requestFocus(),
                            validator: (value) => value?.isEmpty == true ? 'required'.tr : null,
                          ),
                          AuthenticationTextField(
                            hint: 'phoneNumber'.tr,
                            obsecure: false,
                            onSubmitted: (_) => controller.register,
                            focusNode: controller.phoneNumberFocusNode,
                            controller: controller.phoneNumberController,
                            validator: (value) => value?.isEmpty == true ? 'required'.tr : null,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(11)],
                          ),
                          const SizedBox(height: 16),
                          ObxValue<RxBool>(
                            (rxIsRegistering) {
                              final bool isLoading = rxIsRegistering.value;
                              return AppElevatedButton(
                                title: 'register'.tr,
                                isLoading: isLoading,
                                onTap: controller.register,
                              );
                            },
                            controller.isRegistering,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
