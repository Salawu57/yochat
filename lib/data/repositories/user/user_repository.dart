import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user)  async {

    try{
     await _db.collection("users").doc(user.id).set(user.toJson());
     
    } on FirebaseException catch (ex) {
      throw 'createUserWithEmailAndPassword';
    } on FormatException catch (ex) {
      throw 'createUserWithEmailAndPassword';
    } on PlatformException catch (ex) {
      throw 'createUserWithEmailAndPassword';
    } catch (ex) {
      throw 'createUserWithEmailAndPassword';
    }
  }
}
