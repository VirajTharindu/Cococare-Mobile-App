import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/features/authentication/controllers/tracking/tracking_controller.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class Tracking extends StatelessWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TrackingController());

    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: Text("Tracking"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.trackingFormKey,
          child: Column(
            children: [
              Tracking_Form_Container(
                title: "Spread of Disease:",
                onRatingUpdate: (rating) {
                  controller.diseaseSpreadRate = rating;
                },
                commentController: controller.diseasespreadComment,
              ),
              const SizedBox(height: 30),
              Tracking_Form_Container(
                title: "Severity of Symptoms:",
                onRatingUpdate: (rating) {
                  controller.severitySymptomsRate = rating;
                },
                commentController: controller.severitySymptomsComment,
              ),
              const SizedBox(height: 30),
              Tracking_Form_Container(
                title: "Effectiveness of Controlling Measures:",
                onRatingUpdate: (rating) {
                  controller.controllingMeasuresRate = rating;
                },
                commentController: controller.controllingMeasuresComment,
              ),
              const SizedBox(height: 30),
              Tracking_Form_Container(
                title: "Impact on Yield:",
                onRatingUpdate: (rating) {
                  controller.impactYieldRate = rating;
                },
                commentController: controller.impactYieldComment,
              ),
              const SizedBox(height: 30),
              Tracking_Form_Container(
                title: "Resistance of Environmental Conditions:",
                onRatingUpdate: (rating) {
                  controller.environmentalConditionsRate = rating;
                },
                commentController: controller.environmentalConditionsComment,
              ),
              const SizedBox(height: 30),
              ElevatedButtonWidget(
                controller: controller,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class Tracking_Form_Container extends StatelessWidget {
  final String title;
  final TextEditingController commentController;
  final Function(double) onRatingUpdate;

  const Tracking_Form_Container({
    Key? key,
    required this.title,
    required this.onRatingUpdate,
    required this.commentController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 600,
        width: 360,
        decoration: BoxDecoration(
          color: CColors.grey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CColors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(right: 210),
              child: Text(
                "Rate the Status -",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: CColors.darkergrey,
                ),
              ),
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 65,
              unratedColor: CColors.lightgrey,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: CColors.primaryColor,
              ),
              onRatingUpdate: (rating) {
                // Call the onRatingUpdate function and pass the selected rating
                onRatingUpdate(rating);
              },
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 140),
                    child: Text(
                      'Comments -',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: CColors.darkergrey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 200,
                    child: TextFormField(
                      controller: commentController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: const TextStyle(
                          color: CColors.darkgrey, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'Enter your comments...',
                        hintStyle: const TextStyle(
                          color: CColors.darkgrey,
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: CColors.grey.withOpacity(0.7),
                          ),
                        ),
                        filled: true,
                        fillColor: CColors.lightgrey.withOpacity(0.7),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  final TrackingController controller;

  const ElevatedButtonWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () => controller.submitTrackingData(),
        style: ElevatedButton.styleFrom(
          backgroundColor: CColors.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 130,
            vertical: 20,
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: const Text("Report"),
      ),
    );
  }
}
