import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt carousalCurrentIndex = 0.obs;

  void updatePageIndicator(int index) {
    carousalCurrentIndex.value = index;
  }
}
