import 'package:flutter/material.dart';
import 'package:water_app/presentation/ui/app_colors.dart';

class ButtonCircleIndicator extends StatelessWidget {
  const ButtonCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(color: AppColors.whiteColor),
      );
}
