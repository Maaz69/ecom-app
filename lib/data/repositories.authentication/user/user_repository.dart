import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/data/repositories.authentication/authentication_repository.dart';
import 'package:ecom/features/authentication/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

 /// Repository class for user-related operation
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  /// Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: e.plugin,
        code: e.code,
        message: e.message,
      );
    } on FormatException {
      throw const FormatException("Invalid data format.");
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


  /// Function to fetch user details based on user ID.
  Future<UserModel> fetchUserDetails() async {
    try {
      // Fetch the user document by ID
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();

      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        // Return an empty model if no user document is found
        return UserModel.empty();
      }

    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: e.plugin,
        code: e.code,
        message: e.message ?? 'Firebase error while fetching user details.',
      );
    } on PlatformException catch (e) {
      throw PlatformException(
        code: e.code,
        message: e.message ?? 'Platform exception occurred.',
        details: e.details,
      );
    } on FormatException catch (e) {
      throw FormatException('Data format error: ${e.message}');
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }


   /// Function to update user data in Firestore.
  Future<UserModel> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());

      return updatedUser;
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: e.plugin,
        code: e.code,
        message: e.message ?? 'Firebase error while updating user details.',
      );
    } on PlatformException catch (e) {
      throw PlatformException(
        code: e.code,
        message: e.message ?? 'Platform exception occurred.',
        details: e.details,
      );
    } on FormatException catch (e) {
      throw FormatException('Data format error: ${e.message}');
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }


  /// Update any field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: e.plugin,
        code: e.code,
        message: e.message ?? 'Firebase error while updating user field.',
      );
    } on PlatformException catch (e) {
      throw PlatformException(
        code: e.code,
        message: e.message ?? 'Platform exception occurred.',
        details: e.details,
      );
    } on FormatException catch (e) {
      throw FormatException('Data format error: ${e.message}');
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }


}