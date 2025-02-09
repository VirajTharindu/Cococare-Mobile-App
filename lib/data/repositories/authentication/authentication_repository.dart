import 'package:coconut_disease_detection/data/repositories/user/user_repository.dart';
import 'package:coconut_disease_detection/features/authentication/screens/login/login.dart';
import 'package:coconut_disease_detection/features/authentication/screens/onboarding/onboarding.dart';
import 'package:coconut_disease_detection/features/authentication/screens/signup/verify_email.dart';
import 'package:coconut_disease_detection/navigation_menu.dart';
import 'package:coconut_disease_detection/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/format_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/platform_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/firebase_exceptions.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //get authenticated user data
  User? get authUser => _auth.currentUser;

  //called from main.dart on app launch
  //if onboarding & splash should be skipped after the 1st time open

  //@override
  //void onReady() {
  //FlutterNativeSplash.remove();
  //screenRedirect();
  //}

  //function to show relavant screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu()); //should be home
      } else {
        Get.offAll(() => VerifyEmailScreen(
            email: _auth.currentUser?.email)); //should be home
      }
    } else {
      ///local storage

      //if(kDebugMode){
      // print('=======Get Storage========');
      // print(deviceStorage.read('isFirstTime'));
      //}

      deviceStorage.writeIfNull('isFirstTime', true);

      //check if it is the first time launching the app
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  //email and password login & register

  //register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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

  //login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
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

  //update user data
  //Future<void> updateUserData(
  //String name, String email, String phone, String profilePic) async {
  //try {
  //return await auth.currentUser!.updateDisplayName(name);
  //} on CFirebaseAuthException catch (e) {
  //throw CFirebaseAuthException(e.code).message;
  //} on CFirebaseException catch (e) {
  //throw CFirebaseException(e.code).message;
  //} on CFormatException catch (_) {
  //throw const CFormatException();
  //} on CPlatformException catch (e) {
  //throw CPlatformException(e.code).message;
  //} catch (e) {
  // throw 'Something went wrong! Please try again later.';
  //}
  // }

  //re authenticate user

  //email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
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

//resend email verification
//Future<void> resendEmailVerification() async {
//try {
//return await auth.currentUser!.sendEmailVerification();
//} on CFirebaseAuthException catch (e) {
//return null;
//}
//}

//reset password

/*social media login*/

//google

//fb

/*end normal identity & social media login */

//logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
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

//re authenticate user
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      //create a credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      //re authenticate user
      await _auth.currentUser!.reauthenticateWithCredential(credential);
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

//delete account - delete user auth & firebase account
  Future<void> deleteAccount() async {
    try {
      //delete user auth
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
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
}
