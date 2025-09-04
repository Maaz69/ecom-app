import 'package:ecom/Common/widgets/t_circular_icon.dart';
import 'package:ecom/Common/widgets/texts/product_price_text.dart';
import 'package:ecom/Common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: dark ? TColors.darkGrey : TColors.lightContainer,
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
      ),
      child: Row(
        children: [
          /// Expanded Image
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(TSizes.productImageRadius),
                  child: Image.asset(
                    TImages.ProductImage1,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),

                /// Heart Icon only
                Positioned(
                  top: 6,
                  right: 6,
                  child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red, size: 18),
                ),
              ],
            ),
          ),

          const SizedBox(width: TSizes.spaceBtwItems),

          /// Product Details
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Green Nike Half Sleeves Shirt',
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  TBrandTitleTextWithVerifiedIcon(title: 'Nike'),
                  const SizedBox(height: 8),
                  TProductPriceText(price: '256.0'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
