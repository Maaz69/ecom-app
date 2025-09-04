import 'package:ecom/data/repositories.authentication/user/user_repository.dart';
import 'package:ecom/features/personalization/controllers/user_controller.dart';
import 'package:ecom/features/personalization/screens/profile/profile.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/popups/full_screen_loader.dart';
import 'package:ecom/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// Init user Data when Home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try{
      TFullScreenLoader.openLoadingDialog('We are updating your information...', TImages.waitingAnimation);

      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'FirstName' : firstName.text.trim(), 'LastName' : lastName.text.trim()};
        await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();


      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated.');

      Get.off(() => ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
    }
  }




}