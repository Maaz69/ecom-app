import 'package:ecom/Common/widgets/appbar/appbar.dart';
import 'package:ecom/Common/widgets/products/ratings/rating_indicator.dart';
import 'package:ecom/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ecom/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ratings and reviews are verified and are from people who use the same type of device that you use."),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Overall Product Ratings
              TOverallProductRating(),
              TRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: TSizes.spaceBtwSections),

              /// USer Review List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}



