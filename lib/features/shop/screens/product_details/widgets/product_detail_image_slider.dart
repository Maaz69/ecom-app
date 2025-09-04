import 'package:ecom/Common/widgets/appbar/appbar.dart';
import 'package:ecom/Common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecom/Common/widgets/images/t_rounded_image.dart';
import 'package:ecom/Common/widgets/t_circular_icon.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding:
                const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                    child: Image(
                        image: AssetImage(TImages.ProductImage1))),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 1,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) =>
                      SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: 8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => TRoundedImage(
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    padding: EdgeInsets.all(TSizes.sm),
                    imageUrl: TImages.ProductImage3,
                  ),
                ),
              ),
            ),

            /// Appbar Icons
            TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
