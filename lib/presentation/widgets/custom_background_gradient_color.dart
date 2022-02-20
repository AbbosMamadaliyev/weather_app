import 'package:flutter/material.dart';
import 'package:weather_app/core/app_colors.dart';

class CustomBackgroundGradientColor extends StatelessWidget {
  final Widget child;
  const CustomBackgroundGradientColor({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.topLinearGradient,
            AppColors.bottomLinearGradient,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
