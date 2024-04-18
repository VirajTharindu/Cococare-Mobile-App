import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coconut_disease_detection/features/personalization/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:coconut_disease_detection/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/format_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/platform_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/firebase_exceptions.dart';

import 'package:flutter/services.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  //functions to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CFormatException();
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again later.';
    }
  }

  //function to fetch user details based on user ID

  //function to update user details in firestore

  //function to delete user details from firestore
}
