import '../constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final bool isLoading;
  final Color textColor;
  final VoidCallback onTap;
  final Color backgroundColor;

  const AppElevatedButton({
    required this.title,
    required this.onTap,
    this.height = 48,
    this.isLoading = false,
    this.width = double.maxFinite,
    this.textColor = AppColors.background,
    this.backgroundColor = AppColors.primary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, 48),
        backgroundColor: AppColors.primary,
      ),
      child: isLoading
          ? const FractionallySizedBox(
              heightFactor: 0.5,
              child: AspectRatio(
                aspectRatio: 1,
                child: CircularProgressIndicator(color: AppColors.background),
              ),
            )
          : Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                color: AppColors.background,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
