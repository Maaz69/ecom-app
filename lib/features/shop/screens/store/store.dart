import 'package:ecom/Common/widgets/appbar/appbar.dart';
import 'package:ecom/Common/widgets/appbar/tabbar.dart';
import 'package:ecom/Common/widgets/brands/brand_card.dart';
import 'package:ecom/Common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecom/Common/widgets/layouts/grid_layout.dart';
import 'package:ecom/Common/widgets/products/products_cart/cart_menu_icon.dart';
import 'package:ecom/Common/widgets/texts/section_heading.dart';
import 'package:ecom/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(onPressed: (){}, iconColor: Colors.white),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search bar
                      SizedBox(height: TSizes.spaceBtwItems),
                      TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),
      
                      /// -- Featured Brands
                      TSectionHeading(
                          title: 'Feature Brands',
                          onPressed: (){}
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
      
                     TGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index) {
                       return const TBrandCard(showBorder: false);
                     })
      
                    ],
                  ),
                ),
                /// Tabs
                bottom: TTabBar(
                  tabs:
                    [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics')),
                    ],
                ),
              ),
            ];
          },
          body: TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
          ]
          ),
        ),
      ),
    );
  }
}




