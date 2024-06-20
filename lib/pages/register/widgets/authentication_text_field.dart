import '../../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthenticationTextField extends StatelessWidget {
  final String hint;
  final bool obsecure;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const AuthenticationTextField({
    this.focusNode,
    this.validator,
    this.controller,
    this.onSubmitted,
    required this.hint,
    this.inputFormatters,
    required this.obsecure,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = context.textTheme.bodyLarge?.copyWith(
      color: AppColors.primary,
      fontWeight: FontWeight.bold,
    );
    return TextFormField(
      maxLines: 1,
      validator: validator,
      focusNode: focusNode,
      obscureText: obsecure,
      controller: controller,
      textAlign: TextAlign.center,
      onFieldSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
      textAlignVertical: TextAlignVertical.center,
      style: style,
      decoration: InputDecoration(
        hintText: hint,
        border: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
        hintStyle: style?.copyWith(color: style.color?.withOpacity(0.5)),
      ),
    );
  }
}
