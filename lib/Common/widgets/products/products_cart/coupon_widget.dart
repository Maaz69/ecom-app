import 'package:ecom/Common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
      child: Row(
        children: [
          /// Promo Code Input
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a Promo code? Enter here',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),

          /// Apply Button
          ElevatedButton(
            onPressed: () {
              // Handle apply logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
