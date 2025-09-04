import 'package:ecom/features/authentication/screens/login/login.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final PageController pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  List<OnboardingModal> listOnboarding = [
    OnboardingModal(title: TTexts.onBoardingTitle1, subTitle: TTexts.onBoardingSubTitle1, image: TImages.onBoardingImage1),
    OnboardingModal(title: TTexts.onBoardingTitle2, subTitle: TTexts.onBoardingSubTitle2, image: TImages.onBoardingImage2),
    OnboardingModal(title: TTexts.onBoardingTitle3, subTitle: TTexts.onBoardingSubTitle3, image: TImages.onBoardingImage3),
  ];


  /// Update Current Index When page scrolls
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  /// Navigate to the next page or login screen
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
     int page = currentPageIndex.value + 1;
     pageController.jumpToPage(page);
      // Get.to(LoginScreen());
    }
  }

  void dotNavigationClick(int index) {
    currentPageIndex.value = index; // ✅ Update the observable value
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    ); // ✅ Correct way to jump to a page
  }

  /// Skip to the last page
  void skipPage() {
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  /// ✅ Dispose PageController to prevent memory leaks
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class OnboardingModal {
  String title;
  String subTitle;
  String image;

  OnboardingModal({required this.title,required this.subTitle,required this.image});

}