
import 'package:ecom/Common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (_, index) => TRoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row 1
            Row(
              children: [
                /// 1 - ICon
                Icon(Iconsax.ship),
                SizedBox(width: TSizes.spaceBtwItems / 2),
      
                /// 2 - Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),
                      ),
                      Text('07 Nov 2025', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
      
                /// 3 - Icon
                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34, size: TSizes.iconSm)),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
      
            /// Row 2
            Row(
              children: [
                Row(
                  children: [
                    Icon(Iconsax.ship),
                    SizedBox(width: TSizes.spaceBtwItems / 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order', style: Theme.of(context).textTheme.labelMedium),
                        Text('[#635f4]', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: TSizes.spaceBtwItems), // optional spacing
                Expanded(
                  child: Row(
                    children: [
                      Icon(Iconsax.calendar),
                      SizedBox(width: TSizes.spaceBtwItems / 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                          Text('03 Feb 2025', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      
          ],
        ),
      ),
    );
  }
}
