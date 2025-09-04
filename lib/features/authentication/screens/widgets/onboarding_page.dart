import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          /// ✅ Fix Image Size & Fit
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5, // 50% of screen height
            width: double.infinity, // Take full width
            child: Image.asset(
              image,
              fit: BoxFit.cover, // ✅ Prevents distortion
            ),
          ),

          /// ✅ Title
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),

          /// ✅ Subtitle
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
