import 'package:ecom/Common/widgets/Headings/section_heading.dart';
import 'package:ecom/Common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecom/Common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecom/Common/widgets/layouts/grid_layout.dart';
import 'package:ecom/Common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ecom/features/shop/screens/all_products/all_products.dart';
import 'package:ecom/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecom/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecom/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// SearchBar
                  TSearchContainer(text: 'Search in Store'),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Popular Categories Heading
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                    child: Text(
                      'Popular Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections - 10),

                  /// Categories
                  THomeCategories(),

                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// TPromoSlider
                  TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),

                  /// -- Popular Products Section
                  TSectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    onPressed: () => Get.to(() => AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  /// TProduct
                  TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
