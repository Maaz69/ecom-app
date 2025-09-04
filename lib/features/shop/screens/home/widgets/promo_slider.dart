import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/Common/widgets/custom_shapes/container/circular_container.dart';
import 'package:ecom/features/shop/controllers/home_controller.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        /// **Move slider up & Reduce its height**
        Transform.translate(
          offset: const Offset(0, -10),
          child: CarouselSlider(
            options: CarouselOptions(
              height: Get.height * 0.22,
              viewportFraction: 0.88,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) => controller.updatePageIndicator(index),
            ),
            items: banners.map((banner) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  banner,
                  width: Get.width * 0.9,
                  fit: BoxFit.cover,
                ),
              ),
            )).toList(),
          ),
        ),

        ///  **Reduce Gap Between Slider & Indicators**
        const SizedBox(height: 8),

        ///  **Page Indicator**
        Center(
          child: Obx(() => Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(banners.length, (i) => TCircularContainer(
                width: 16,
                height: 4,
                margin: const EdgeInsets.only(right: 6),
                backgroundColor: controller.carousalCurrentIndex.value == i
                    ? TColors.primary
                    : TColors.grey,
              ))),
          ),
        )
      ],
    );
  }
}
