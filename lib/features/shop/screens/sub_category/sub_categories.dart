import 'package:ecom/Common/widgets/appbar/appbar.dart';
import 'package:ecom/Common/widgets/images/t_rounded_image.dart';
import 'package:ecom/Common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:ecom/Common/widgets/texts/section_heading.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              TRoundedImage(
                  width: double.infinity,
                  imageUrl: TImages.promoBanner1,
                  applyImageRadius: true,
                fit: BoxFit.cover,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Su-Categories
              Column(
                children: [
                  /// Heading
                  TSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 130,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      // 👇 Reduce or remove left padding
                      padding: const EdgeInsets.only(left: 8, right: TSizes.defaultSpace),
                      separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (context, index) => SizedBox(
                        width: 310,
                        child: TProductCardHorizontal(),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
