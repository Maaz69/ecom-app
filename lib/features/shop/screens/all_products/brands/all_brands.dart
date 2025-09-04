import 'package:ecom/Common/widgets/appbar/appbar.dart';
import 'package:ecom/Common/widgets/brands/brand_card.dart';
import 'package:ecom/Common/widgets/layouts/grid_layout.dart';
import 'package:ecom/Common/widgets/products/sortable/sortable_products.dart';
import 'package:ecom/Common/widgets/texts/section_heading.dart';
import 'package:ecom/features/shop/screens/all_products/brands/brand_products.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Brands'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Dropdown
              DropdownButtonFormField(
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value) {},
                items: [
                  'Name',
                  'Higher Price',
                  'Lower Price',
                  'Sale',
                  'Newest',
                  'Popularity'
                ]
                    .map((option) =>
                        DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              ),

              /// Heading
              TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Brands
              TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => TBrandCard(
                      showBorder: true,
                      onTap: () => Get.to(() => BrandProducts()))),
            ],
          ),
        ),
      ),
    );
  }
}
