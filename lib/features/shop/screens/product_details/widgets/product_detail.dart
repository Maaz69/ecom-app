import 'package:ecom/Common/widgets/texts/section_heading.dart';
import 'package:ecom/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecom/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecom/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecom/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecom/features/shop/screens/product_details/widgets/rating_share_widget.share.dart';
import 'package:ecom/features/shop/screens/product_reviews/widgets/product_reviews.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            TProductImageSlider(),

            /// 2 - Product Details
            Padding(
                padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share
                  TRatingAndShare(),

                  /// - Price, Title, Stock & Brand
                  TProductMetaData(),

                  /// -- Attributes
                  TProductAttributes(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Description
                  TSectionHeading(title: 'Description', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    'This is a Product description for Nike Red Sports Shoes. There are more things that can be added but this is enough for now.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// -- Reviews
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(icon: Icon(Iconsax.arrow_right_3, size: 18), onPressed: () => Get.to(() => ProductReviewsScreen())),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


