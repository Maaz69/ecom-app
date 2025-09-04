import 'package:ecom/Common/widgets/loaders/animation_loader.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A Utility class for managing a full-screen loading dialog.
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  static void openLoadingDialog(String text, String animation ,) {
    if (Get.overlayContext == null) return;

     showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog.
  static void stopLoading() {
      Navigator.of(Get.context!).pop();
  }
}
