import 'package:ecom/Common/widgets/layouts/grid_layout.dart';
import 'package:ecom/Common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(height: TSizes.spaceBtwItems),
        /// Products
        TGridLayout(itemCount: 4, itemBuilder: (_, index) => TProductCardVertical()),
      ],
    );
  }
}
