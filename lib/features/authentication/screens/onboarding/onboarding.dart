import 'package:ecom/features/authentication/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  RxInt CurrentPageIndex = 0.obs;

  /// Update Current Index When page scroll
  void updatePageIndicator(index) => CurrentPageIndex.value = index;

  /// Update Current Index & jump to next page
  void nextPage() {
    if (CurrentPageIndex.value == 2) {
      final storage = GetStorage();




      Get.offAll(const LoginScreen());
    } else {
      int page = CurrentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & Jump to the last page
  void skipPage() {
    CurrentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}

