import 'package:coconut_disease_detection/common/network_manager.dart';
import 'package:coconut_disease_detection/data/repositories/authentication/authentication_repository.dart';
import 'package:coconut_disease_detection/data/repositories/user/user_repository.dart';
import 'package:coconut_disease_detection/features/authentication/screens/signup/verify_email.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:coconut_disease_detection/utils/popups/full_screen_loader.dart';
import 'package:coconut_disease_detection/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; //observable hiding or showing password
  final termsprivacy = true.obs;
  final hideConfirmPassword = true.obs;
  final firstname = TextEditingController(); //for input
  final lastname = TextEditingController();
  final username = TextEditingController();
  final nationalID = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();
  //final confirmPassword = TextEditingController();
  GlobalKey<FormState> signupFormKey1 = GlobalKey<FormState>();

  //form validation

//signup
  void signup() async {
    try {
      //start loading
      CFullScreenLoader.openLoadingDialog('Please wait...', CImages.loading);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //stop loading
        CFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey1.currentState!.validate()) {
        //stop loading
        CFullScreenLoader.stopLoading();

        return;
      }

      //terms & privacy policy check
      if (!termsprivacy.value) {
        CLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "You must read and accept the Privacy Policy & Terms to continue.",
        );
        return;
      }

      //check password and confirm password
      // if (password.text != confirmPassword.text) {
      // CLoaders.warningSnackBar(
      // title: "Password Mismatch",
      // message: "Password and Confirm Password must be same",
      //);
      //return;
      //}

      //check email
      if (!GetUtils.isEmail(email.text)) {}

      //register user in firebase authentication & save user data in firebase firestore
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save user data in firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstname.text.trim(),
        lastName: lastname.text.trim(),
        userName: username.text.trim(),
        nationalID: nationalID.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        address: address.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //stop loading
      CFullScreenLoader.stopLoading();

      //show success message
      CLoaders.successSnackBar(
        title: "Success",
        message: "Account created successfully! Verify e-mail to continue",
      );

      //move to verify email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      //stop loading
      CFullScreenLoader.stopLoading();

      //show error message
      CLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
