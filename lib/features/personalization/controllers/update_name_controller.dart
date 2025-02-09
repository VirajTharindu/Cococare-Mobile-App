import 'package:coconut_disease_detection/common/network_manager.dart';
import 'package:coconut_disease_detection/data/repositories/user/user_repository.dart';
import 'package:coconut_disease_detection/features/personalization/controllers/user_controller.dart';
import 'package:coconut_disease_detection/features/personalization/screens/profile.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:coconut_disease_detection/utils/popups/full_screen_loader.dart';
import 'package:coconut_disease_detection/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //init user data when name screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  //update user name
  Future<void> updateUserName() async {
    try {
      //start loading
      CFullScreenLoader.openLoadingDialog('Updating name...', CImages.loading);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //stop loading
        CFullScreenLoader.stopLoading();
        return;
      }

      //check form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        //stop loading
        CFullScreenLoader.stopLoading();
        return;
      }

      //update 1st & last name in firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //stop loading
      CFullScreenLoader.stopLoading();

      //show success message
      CLoaders.successSnackBar(
          title: 'Congratulations!', message: 'Name updated successfully!');

      //move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      CFullScreenLoader.stopLoading();
      CLoaders.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }
}
