import 'package:ecom/Common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.1)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
          ? TColors.darkerGrey
          : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          /// -- Selection Tick Icon
          if (selectedAddress)
            Positioned(
              right: 0,
              top: 0,
              child: Icon(
                Iconsax.tick_circle5,
                color: dark ? TColors.light : TColors.dark,
              ),
            ),

          /// -- Address Details
          Padding(
            padding: const EdgeInsets.only(right: 30.0), // Space for the tick icon
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: TSizes.sm / 2),
                Text(
                  '(+143) 465 7890',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: TSizes.sm / 2),
                Text(
                  '83547 Timmy Hoover, South Liana, Maine, 87665, USA',
                  style: Theme.of(context).textTheme.bodyMedium,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
