import 'package:ecom/Common/widgets/images/t_rounded_image.dart';
import 'package:ecom/Common/widgets/texts/product_title_text.dart';
import 'package:ecom/Common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Product Image
        TRoundedImage(
          imageUrl: TImages.ProductImage5,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        SizedBox(width: TSizes.spaceBtwItems),

        /// Product Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleTextWithVerifiedIcon(title: 'Nike'),
              SizedBox(height: 4),
              TProductTitleText(title: 'Black Slippers', maxLines: 1),
              SizedBox(height: 4),

              /// Product Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green  ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: 'Size: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'UK 08',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
