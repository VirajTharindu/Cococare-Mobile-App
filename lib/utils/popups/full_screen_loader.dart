import 'package:coconut_disease_detection/common/loaders/animation_loader.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//utility class for showing full screen loader
class CFullScreenLoader {
  //open a full screen loading dialog with a given text & animation

  //this method does not return anything

  //parameters:
  //text: String - text to be displayed in the loading dialog
  //animation: String - lottie animation to be displayed in the loading dialog

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, //to overlay dialogs
      barrierDismissible:
          false, //dialog can't be dismissed by tapping outside it
      builder: (_) => WillPopScope(
        onWillPop: () async =>
            false, // disable popping with back button //disable poping with back button

        child: Container(
          color: CHelperFunctions.isDarkMode(Get.context!)
              ? CColors.dark
              : CColors.white,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 250),
                //CAnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //stop open loading dialog
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
