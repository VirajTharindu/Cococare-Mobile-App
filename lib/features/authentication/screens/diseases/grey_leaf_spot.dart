import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Grey_Leaf_Spot extends StatelessWidget {
  const Grey_Leaf_Spot({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: Text('Coconut Grey Leaf Spot'),
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
              'Grey Leaf Spot', // Heading text
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'Pestalotiopsis palmarum', // Subtitle text
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
                                            "Brownish-Gray Lesions",
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
                                            "Elongated Necrotic Spots",
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
                                            "Yellowing Around Lesions",
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
                                            "Premature Leaf Shedding ",
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
                                            "Stunted Leaf Growth",
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
                                            "Reduced Fruit Production",
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
                                              image: AssetImage(CImages.gls5),
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
                                        'Causes:',
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
                                            "Fungal pathogen Cercospora spp.",
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
                                            "Warm and humid climate",
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
                                            "Poor air circulation among trees",
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
                                            "Overhead irrigation",
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
                                            "High humidity levels",
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
                                            "Infected plant debris and residue",
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
                                              image: AssetImage(CImages.gls6),
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
                                        'Treatments:',
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
                                            "Copper Fungicide Sprays",
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
                                            "Pruning infected leaves.",
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
                                            "Proper irrigation practices.",
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
                                            "Fertilizer application for plant health",
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
                                            "Removing infected plant debris",
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
                                            "Implementing crop rotation",
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
                                              image: AssetImage(CImages.gls7),
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
                                        'Fungicides:',
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
                                            "Potassium bicarbonate (natural fungicide)",
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
                                            "Copper-based fungicides (chemical)",
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
                                            "Sulfur-based fungicides (chemical)",
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
                                            "Balanced NPK fertilizers (chemical)",
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
                                            "Tebuconazole + Hexaconazole (chemical)",
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
                                            "Propiconazole Fungicide (chemical)",
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
                                              image: AssetImage(CImages.gls8),
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
                                        'Practises:',
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
                                            "Regular inspection of leaves",
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
                                            "Proper spacing between trees for airflow",
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
                                            "Pruning of affected leaves and branches.",
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
                                            "Application of fungicides in early stages",
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
                                            "Maintain soil moisture & reduce splash-back",
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
                                            "Proper drainage to prevent waterlogging.",
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
                                              image: AssetImage(CImages.gls9),
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
                              'https://youtu.be/8UvIZKjR93k?si=jjEMI2BYa7AQUzyj'),
                          child: const Text(
                            'Learn more about Grey Leaf Spot on YouTube',
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
        CImages.gls1,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.gls2,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.gls3,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.gls4,
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
