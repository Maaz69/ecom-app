import 'package:ecom/Common/styles/shadows.dart';
import 'package:ecom/Common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom/Common/widgets/images/t_rounded_image.dart';
import 'package:ecom/Common/widgets/t_circular_icon.dart';
import 'package:ecom/Common/widgets/texts/product_price_text.dart';
import 'package:ecom/Common/widgets/texts/product_title_text.dart';
import 'package:ecom/Common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:ecom/features/shop/screens/product_details/widgets/product_detail.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  TRoundedImage(
                    imageUrl: TImages.ProductImage1,
                    applyImageRadius: true,
                    fit: BoxFit.cover,  // Ensure the image fits the container nicely
                  ),

                  /// Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  /// Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// Product Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Title
                  const TProductTitleText(
                    title: 'Nike Shoes',
                    smallSize: true,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// Brand Name & Verified Icon
                  TBrandTitleTextWithVerifiedIcon(title: 'Nike'),
                  /// Price & Add to Cart Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      TProductPriceText(price: '35.0'),

                      /// Add Button
                      GestureDetector(
                        onTap: () {
                          // Add the product to cart
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: TColors.dark,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomLeft: Radius.circular(TSizes.productImageRadius),
                            ),
                          ),
                          child: SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: const Center(
                              child: Icon(Iconsax.add, color: TColors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

