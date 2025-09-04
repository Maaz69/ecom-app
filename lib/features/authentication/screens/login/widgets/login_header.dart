import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:ecom/utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Logo
        Image.asset(
          dark ? TImages.lightAppLogo : TImages.darkAppLogo,
          width: 150, // Set a reasonable width
          height: 150, // Set a reasonable height
          fit: BoxFit.contain, // Adjusts image inside the container
        ),
        const SizedBox(height: TSizes.spaceBtwSections), // Added spacing for better UI

        /// Title
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSizes.sm), // Keep spacing consistent

        /// Subtitle
        Text(
          TTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
