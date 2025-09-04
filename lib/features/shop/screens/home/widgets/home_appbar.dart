import 'package:ecom/Common/widgets/products/products_cart/cart_menu_icon.dart';
import 'package:ecom/Common/widgets/shimmer/shimmer.dart';
import 'package:ecom/features/personalization/controllers/user_controller.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class THomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0, //
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            () {
             if (controller.profileLoading.value){
              return TShimmerEffect(width: 80, height: 15);
             } else {
               return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.darkerGrey));
             }
              return Text(
                  controller.user.value.fullName,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                );
            }),
        ],
      ),
      actions: [
        TCartCounterIcon(onPressed: () {}, iconColor: TColors.white),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
}
