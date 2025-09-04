import 'package:ecom/features/authentication/controllers/login/login_controller.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(TImages.google),
              ),
          ),
        ),
      ],
    );
  }

  /// Helper method to create a social button
  Widget _buildSocialButton(String imagePath, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: TColors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          imagePath,
          width: TSizes.iconMd,
          height: TSizes.iconMd,
        ),
      ),
    );
  }
}
