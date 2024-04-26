import 'package:coconut_disease_detection/common/network_manager.dart';
import 'package:coconut_disease_detection/data/repositories/tracking/tracking_repository.dart';
import 'package:coconut_disease_detection/features/authentication/models/tracking_model.dart';
import 'package:coconut_disease_detection/features/authentication/screens/home/home.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:coconut_disease_detection/utils/popups/full_screen_loader.dart';
import 'package:coconut_disease_detection/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackingController extends GetxController {
  static TrackingController get instance => Get.find();

  /// Rating variables
  double diseaseSpreadRate = 0;
  double severitySymptomsRate = 0;
  double controllingMeasuresRate = 0;
  double impactYieldRate = 0;
  double environmentalConditionsRate = 0;

  /// Text Editing Controllers

  final diseasespreadComment = TextEditingController();

  final severitySymptomsComment = TextEditingController();

  final controllingMeasuresComment = TextEditingController();

  final impactYieldComment = TextEditingController();

  final environmentalConditionsComment = TextEditingController();

  /// Form Key
  final GlobalKey<FormState> trackingFormKey = GlobalKey<FormState>();

  /// Submit Function
  void submitTrackingData() async {
    try {
      // Start loading
      CFullScreenLoader.openLoadingDialog('Please wait...', CImages.loading);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Stop loading
        CFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!trackingFormKey.currentState!.validate()) {
        // Stop loading
        CFullScreenLoader.stopLoading();
        return;
      }

      // Generate a unique ID for the tracking data
      final String trackingId =
          DateTime.now().millisecondsSinceEpoch.toString();

      //save tracking data in firebase firestore
      final newTrackingData = TrackingDataModel(
        id: trackingId,
        controllingMeasuresComment: controllingMeasuresComment.text.trim(),
        controllingMeasuresRate: controllingMeasuresRate,
        diseaseSpreadRate: diseaseSpreadRate,
        diseasespreadComment: diseasespreadComment.text.trim(),
        environmentalConditionsComment:
            environmentalConditionsComment.text.trim(),
        environmentalConditionsRate: environmentalConditionsRate,
        impactYieldComment: impactYieldComment.text.trim(),
        impactYieldRate: impactYieldRate,
        severitySymptomsComment: severitySymptomsComment.text.trim(),
        severitySymptomsRate: severitySymptomsRate,
      );

      final trackingRepository = Get.put(TrackingRepository());
      await trackingRepository.saveTrackingRecord(newTrackingData);

      // Stop loading
      CFullScreenLoader.stopLoading();

      // Show success message
      CLoaders.successSnackBar(
        title: "Success",
        message: "Tracking data submitted successfully!",
      );

      //move to relavant screen
      Get.to(() => const HomeScreen());
    } catch (e) {
      // Stop loading
      CFullScreenLoader.stopLoading();

      // Show error message
      CLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
