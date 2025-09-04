import 'package:ecom/data/repositories.authentication/authentication_repository.dart';
import 'package:ecom/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/http/network_manager.dart';
import 'package:ecom/utils/popups/full_screen_loader.dart';
import 'package:ecom/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send reset password email
  Future<void> sendPasswordResetEmail(String userEmail) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.waitingAnimation);

      // Check Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(title: 'No Internet', message: 'Please check your connection.');
        return;
      }

      // Send Email To Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(userEmail);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Snackbar
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Password reset link sent to your email.',
      );

      // Navigate to confirmation screen
      Get.to(() => ResetPassword(email: userEmail));

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
