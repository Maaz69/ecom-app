import 'package:ecom/Common/widgets/imagee_text_widgets/vertical_image_text.dart';
import 'package:ecom/features/shop/screens/sub_category/sub_categories.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TVerticalImageText(
              image: TImages.shoeIcon,
              title: 'Shoes',
              onTap: () => Get.to(() => SubCategoriesScreen()),
            ),
          );
        },
      ),
    );
  }
}
