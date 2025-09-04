import 'package:ecom/Common/widgets/Headings/section_heading.dart';
import 'package:ecom/Common/widgets/brands/brand_show_case.dart';
import 'package:ecom/Common/widgets/layouts/grid_layout.dart';
import 'package:ecom/Common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Brands
              TBrandShowcase(
                images: [
                  TImages.ProductImage3,
                  TImages.ProductImage2,
                  TImages.ProductImage1,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Section Heading
              TSectionHeading(
                title: 'You might like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Product Grid
              TGridLayout(
                itemCount: 2,
                itemBuilder: (_, index) => const TProductCardVertical(),
              ),

              /// -- Bottom Padding
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
