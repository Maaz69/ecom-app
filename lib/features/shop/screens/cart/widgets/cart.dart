import 'package:ecom/Common/widgets/appbar/appbar.dart';
import 'package:ecom/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecom/features/shop/screens/checkout/widgets/checkout.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
            showBackArrow: true,
            title:
                Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
        body: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),

          /// Items in cart
          child: TCartItems()
        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to (() => CheckoutScreen()),
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.primary, // Use your app's primary color
            minimumSize: Size(double.infinity, 50), // Full-width button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded edges
            ),
          ),
          child: Text(
            'Checkout \$256.0',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}


