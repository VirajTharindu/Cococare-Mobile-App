import 'package:coconut_disease_detection/common/network_manager.dart';
import 'package:coconut_disease_detection/data/repositories/disease_event/disease_event_repositary.dart';
import 'package:coconut_disease_detection/features/authentication/models/disease_event_model.dart';
import 'package:coconut_disease_detection/features/authentication/screens/disease_event_list/disease_event_list.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';

import 'package:coconut_disease_detection/utils/popups/full_screen_loader.dart';
import 'package:coconut_disease_detection/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Disease_Event_Controller extends GetxController {
  static Disease_Event_Controller get instance => Get.find();

  final diseaseName = TextEditingController();

  GlobalKey<FormState> diseaseEventFormKey = GlobalKey<FormState>();

  void submitDiseaseEvent() async {
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
      if (!diseaseEventFormKey.currentState!.validate()) {
        // Stop loading
        CFullScreenLoader.stopLoading();
        return;
      }

      // Get an instance of DiseaseEventRepository
      final diseaseEvent = DiseaseEventRepository();

      // Get the count of existing disease events
      int existingCount = await diseaseEvent.getDiseaseEventCount();

      // Format the current date and time without time zone
      final formattedDateTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

      // Create a new DiseaseEvent object
      final newDiseaseEvent = DiseaseEventModel(
        id: 'DiseaseEvent${existingCount + 1}',
        diseaseName: diseaseName.text.trim(),
        dateTime: formattedDateTime,
      );

      // Save the disease event to the repository
      final diseaseEventRepository = Get.put(DiseaseEventRepository());
      await diseaseEventRepository.saveDiseaseEvent(newDiseaseEvent);

      // Stop loading
      CFullScreenLoader.stopLoading();

      // Show success message
      CLoaders.successSnackBar(
        title: 'Success',
        message: 'Disease event submitted successfully!',
      );

      // Reset the form fields
      diseaseName.clear();

      //move to verify email screen
      Get.to(() => const Disease_Event_List());
    } catch (e) {
      // Stop loading
      CFullScreenLoader.stopLoading();

      // Show error message
      CLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
