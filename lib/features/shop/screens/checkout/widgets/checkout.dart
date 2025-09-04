import 'package:ecom/Common/success_screen/success_screen.dart';
import 'package:ecom/Common/widgets/appbar/appbar.dart';
import 'package:ecom/Common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom/Common/widgets/products/products_cart/coupon_widget.dart';
import 'package:ecom/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecom/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecom/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecom/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecom/navigation_menu.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in cart
              TCartItems(showAddRemoveButtons: false),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Coupon TextField
              TCouponCode(),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment method
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Address
                    TBillingAdressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => NavigationMenu()))),
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
