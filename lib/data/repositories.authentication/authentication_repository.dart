import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/features/authentication/screens/login/login.dart';
import 'package:ecom/features/authentication/screens/onboarding.dart';
import 'package:ecom/features/authentication/screens/signup.widgets/verify_email.dart';
import 'package:ecom/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

   /// Function to Show Relevant Screen
   screenRedirect() async {
     User? user = _auth.currentUser;
    if(user != null) {
      if(user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
    }
  }


  /* -------------------- Email & Password sign-in ------------------- */
  /// [EmailAuthentication] - Login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.plugin, code: e.code, message: e.message);
    } on FormatException catch (_) {
      throw const FormatException('Invalid format');
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code, message: e.message, details: e.details);
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }


  /// [EmailAuthentication] - Register with Email & Password
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
        email: e.email,
        credential: e.credential,
      );
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: e.plugin,
        code: e.code,
        message: e.message,
      );
    } on FormatException {
      throw const FormatException("Invalid format encountered.");
    } on PlatformException catch (e) {
      throw PlatformException(
        code: e.code,
        message: e.message,
        details: e.details,
      );
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
        email: e.email,
        credential: e.credential,
      );
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: e.plugin,
        code: e.code,
        message: e.message,
      );
    } on FormatException {
      throw const FormatException("Invalid format.");
    } on PlatformException catch (e) {
      throw PlatformException(
        code: e.code,
        message: e.message,
        details: e.details,
      );
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }

/// [EmailAuthentication] - Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
        email: e.email,
        credential: e.credential,
      );
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: e.plugin,
        code: e.code,
        message: e.message,
      );
    } on FormatException {
      throw const FormatException("Invalid format.");
    } on PlatformException catch (e) {
      throw PlatformException(
        code: e.code,
        message: e.message,
        details: e.details,
      );
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }


  /* -------------------- Federated identity & social sign-in ------------------- */

  /// [GoogleAuthentication] - Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Use the correct named constructor for GoogleSignIn
      final GoogleSignIn googleSignIn = GoogleSignIn.standard();

      // Start the sign-in flow
      final GoogleSignInAccount? userAccount = await googleSignIn.signIn();
      if (userAccount == null) {
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user.',
        );
      }

      // Get auth details
      final GoogleSignInAuthentication googleAuth = await userAccount.authentication;

      // Create Firebase credential
      final OAuthCredential credentials = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Sign in and return credential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
        email: e.email,
        credential: e.credential,
      );
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: e.plugin,
        code: e.code,
        message: e.message,
      );
    } on FormatException {
      throw const FormatException("Invalid format.");
    } on PlatformException catch (e) {
      throw PlatformException(
        code: e.code,
        message: e.message,
        details: e.details,
      );
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }




  /// [FacebookAuthentication] - Facebook

  /* -------------------- ./end Federated identity & Social sign-in ------------------- */

  /// [LogoutUSer] -- Valid For any Validation
  Future<void> logout() async {
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Optional: Sign out from Google if using Google Sign-In
      await GoogleSignIn().signOut();

      // Clear local storage (including onboarding flags)
      await deviceStorage.erase();

      // Redirect to onboarding or login (based on your flow)
      Get.offAll(() => const OnBoardingScreen()); // Or LoginScreen if onboarding shouldn't repeat
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message ?? 'An unknown FirebaseAuth error occurred.',
      );
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: e.plugin,
        code: e.code,
        message: e.message ?? 'A Firebase error occurred.',
      );
    } on PlatformException catch (e) {
      throw PlatformException(
        code: e.code,
        message: e.message ?? 'A platform error occurred.',
        details: e.details,
      );
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }





/// DELETE USER - Remove user Auth and Firestore Account.

}
