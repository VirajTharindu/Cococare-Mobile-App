import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Leaf_Rot extends StatelessWidget {
  const Leaf_Rot({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: Text('Coconut Leaf Rot'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 275.0, // Adjust height as needed
                width: double.infinity, // Adjust width as needed
                decoration: BoxDecoration(
                  color: CColors.grey.withOpacity(0.7), // Set background color
                ),

                //2nd container
                child: _buildFourImageGrid(), // Call the new function
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwSections),
            // Add SizedBox for spacing
            const Text(
              'Stem Bleeding', // Heading text
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'Thielaviopsis paradoxa', // Subtitle text
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: CColors.darkgrey,
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwSections),

            Center(
              child: Column(
                children: [
                  Container(
                    height: 2200,
                    width: 360,
                    decoration: BoxDecoration(
                      color: CColors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // Use Column for vertical stacking
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 400,
                                width: double.infinity,

                                decoration: BoxDecoration(
                                  color: CColors.lightgrey,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(right: 225, top: 15),
                                      child: Text(
                                        'Symptoms:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: CColors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),

                                    const SizedBox(height: 0),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        height: 150,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color:
                                                CColors.grey.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                              image: AssetImage(CImages.sb1),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                  ],
                                ), // Just for illustration
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 400,
                                width: double.infinity,

                                decoration: BoxDecoration(
                                  color: CColors.lightgrey,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(right: 225, top: 15),
                                      child: Text(
                                        'Symptoms:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: CColors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),

                                    const SizedBox(height: 0),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        height: 150,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color:
                                                CColors.grey.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                              image: AssetImage(CImages.sb1),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                  ],
                                ), // Just for illustration
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 400,
                                width: double.infinity,

                                decoration: BoxDecoration(
                                  color: CColors.lightgrey,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(right: 225, top: 15),
                                      child: Text(
                                        'Symptoms:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: CColors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),

                                    const SizedBox(height: 0),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        height: 150,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color:
                                                CColors.grey.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                              image: AssetImage(CImages.sb1),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                  ],
                                ), // Just for illustration
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 400,
                                width: double.infinity,

                                decoration: BoxDecoration(
                                  color: CColors.lightgrey,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(right: 225, top: 15),
                                      child: Text(
                                        'Symptoms:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: CColors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),

                                    const SizedBox(height: 0),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        height: 150,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color:
                                                CColors.grey.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                              image: AssetImage(CImages.sb1),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                  ],
                                ), // Just for illustration
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 400,
                                width: double.infinity,

                                decoration: BoxDecoration(
                                  color: CColors.lightgrey,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(right: 225, top: 15),
                                      child: Text(
                                        'Symptoms:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: CColors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),

                                    const SizedBox(height: 0),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Add more bullet points as needed
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "• ",
                                            style: TextStyle(
                                                color: CColors.primaryColor),
                                          ),
                                          Text(
                                            "This is the symptom of stem bleeding...",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: CColors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        height: 150,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color:
                                                CColors.grey.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                              image: AssetImage(CImages.sb1),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                  ],
                                ), // Just for illustration
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        // ... your existing bullet points ...

                        const SizedBox(height: 10.0), // Add some spacing

                        GestureDetector(
                          onTap: () => _launchURL(
                              'https://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID'),
                          child: const Text(
                            'Learn more about Stem Bleeding on YouTube',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: CColors
                                  .primaryColor, // Adjust color as needed
                              decoration: TextDecoration
                                  .underline, // Add underline for clear indication
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFourImageGrid() {
  return GridView.count(
    crossAxisCount: 2, // Two buttons per row
    childAspectRatio: 1.5, // Aspect ratio for square buttons
    mainAxisSpacing: 0, // Spacing between rows
    crossAxisSpacing: 0, // Spacing between buttons
    children: [
      Image.asset(
        CImages.sb1,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.sb2,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.sb3,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.sb4,
        fit: BoxFit.cover,
      ),
    ],
  );
}

void _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    CLoaders.errorSnackBar(title: 'Error!', message: 'Could not launch $url');
  }
}
