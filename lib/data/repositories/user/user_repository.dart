import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yo_chat/authentication/models/user_model.dart';
import 'package:yo_chat/data/repositories/authentication/authentication_repository.dart';
import 'package:yo_chat/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:yo_chat/utils/exceptions/firebase_exceptions.dart';
import 'package:yo_chat/utils/exceptions/format_exceptions.dart';
import 'package:yo_chat/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

//function to fetch user data in firebase
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();

      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

  //function to update user data in firebase
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

  //update any fields in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

  //update any fields in specific user collection
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("users").doc(userId).delete();
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

  //upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }
}
