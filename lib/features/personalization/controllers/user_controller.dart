import 'dart:convert';
import 'dart:io';

import 'package:coconut_disease_detection/common/network_manager.dart';
import 'package:coconut_disease_detection/data/repositories/authentication/authentication_repository.dart';
import 'package:coconut_disease_detection/data/repositories/user/user_repository.dart';
import 'package:coconut_disease_detection/features/authentication/screens/login/login.dart';
import 'package:coconut_disease_detection/features/personalization/models/user_model.dart';
import 'package:coconut_disease_detection/features/personalization/screens/widgets/re_authenticate_user_login_form.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/exceptions/firebase_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/format_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/platform_exceptions.dart';
import 'package:coconut_disease_detection/utils/popups/full_screen_loader.dart';
import 'package:coconut_disease_detection/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();

  final imageUploading = false.obs;

  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      //add statements
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //refresh user record
      //1st update Rx User & then check if user data is already stored. if not store new data
      await fetchUserRecord();

      //if no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          //convert name to 1st & last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          //map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
            userName: username,
            nationalID: '',
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            address: '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          //save user record
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      CLoaders.warningSnackBar(
        title: 'Data not saved!',
        message:
            'An error occurred while saving user record. Please try again later.',
      );
    }
  }

  //delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account? This action cannot be undone because all your data will be deleted peremanently!',
      contentPadding: const EdgeInsets.all(CSizes.md),
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: CSizes.lg),
            child: Text('Delete Account')),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  //delete account
  void deleteUserAccount() async {
    try {
      CFullScreenLoader.openLoadingDialog('Processing...', CImages.loading);

      //1st re authenticate
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        //re write auth email
        if (provider == 'password') {
          CFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticateUserLoginForm());
        }
      }
    } catch (e) {
      CFullScreenLoader.stopLoading();

      CLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //re authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      CFullScreenLoader.openLoadingDialog('Processing...', CImages.loading);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        CFullScreenLoader.stopLoading();

        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        CFullScreenLoader.stopLoading();

        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());

      await AuthenticationRepository.instance.deleteAccount();

      CFullScreenLoader.stopLoading();

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      CFullScreenLoader.stopLoading();

      CLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //upload profile image
  UploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (image != null) {
        imageUploading.value = true;

        //upload image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        //update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};

        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        CLoaders.successSnackBar(
          title: 'Success!',
          message: 'Profile picture updated successfully!',
        );
      }
    } catch (e) {
      CLoaders.warningSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    } finally {
      imageUploading.value = false;
    }
  }
}
