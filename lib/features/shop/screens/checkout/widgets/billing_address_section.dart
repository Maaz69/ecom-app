import 'package:ecom/Common/widgets/Headings/section_heading.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAdressSection extends StatelessWidget {
  const TBillingAdressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){}),
        Text('Maz Javed', style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: TSizes.spaceBtwItems / 2),


        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            SizedBox(height: TSizes.spaceBtwItems),
            Text('+92-317-8880564', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            SizedBox(height: TSizes.spaceBtwItems),
            Text('South Liana, Maine 87659, USA', style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
      ],
    );
  }
}
