import 'package:ecom/data/repositories.authentication/authentication_repository.dart';
import 'package:ecom/data/repositories.authentication/user/user_repository.dart';
import 'package:ecom/features/authentication/models/user_model.dart';
import 'package:ecom/features/authentication/screens/signup.widgets/verify_email.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/http/network_manager.dart';
import 'package:ecom/utils/popups/full_screen_loader.dart';
import 'package:ecom/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- SIGNUP
   void signup() async {
    try {
      // Start Loading
      // TFullScreenLoader.openLoadingDialog(
      //   'We are processing your information....',
      //   TImages.waitingAnimation,
      //
      // );

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.warningSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection and try again.',
        );
        return;
      }

      // Validate form
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      // Privacy Policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
          'In order to create account, you must accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register user in Firebase Auth
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      if (userCredential.user == null) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: 'Signup Failed',
          message: 'User registration failed. Please try again.',
        );
        return;
      }

      // Send email verification
      await userCredential.user!.sendEmailVerification();

      // Save user to Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Show success and navigate
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',
      );

      Navigator.push(
        Get.context!,
        MaterialPageRoute(builder: (context) =>  VerifyEmailScreen(email: email.text.trim())),
      );

    } catch (e) {
      // Show error
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
