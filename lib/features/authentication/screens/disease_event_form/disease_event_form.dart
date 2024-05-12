import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/features/authentication/controllers/disease_event/disease_event_controller.dart';
import 'package:coconut_disease_detection/features/authentication/screens/disease_event_list/disease_event_list.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Disease_Event_Form extends StatelessWidget {
  const Disease_Event_Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Disease_Event_Controller());

    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: Text('Disease Event Form'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.diseaseEventFormKey,
              child: Column(
                children: [
                  Container(
                    width: 360,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CColors.grey.withOpacity(0.7),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 260),
                          child: Text('Disease-',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: CColors.darkergrey)),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 320,
                          child: TextFormField(
                            controller: controller.diseaseName,
                            style: const TextStyle(
                                color: CColors.darkgrey, fontSize: 18),
                            decoration: InputDecoration(
                              hintText: 'Enter the Disease Name',
                              hintStyle: const TextStyle(
                                  color: CColors.darkgrey, fontSize: 18),
                              filled: true,
                              fillColor: CColors.lightgrey.withOpacity(0.7),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: CColors.lightgrey.withOpacity(0.7),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 320,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CColors.primaryColor,
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => controller.submitDiseaseEvent(),
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
