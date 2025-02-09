import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Coconut_Catapilar extends StatelessWidget {
  const Coconut_Catapilar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: Text('Coconut Catapilar'),
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
              'Cocount Caterpilar Infection', // Heading text
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'Opisina arenosella Walker', // Subtitle text
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
                                            "Leaf skeletonization",
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
                                            "Presence of caterpillar frass",
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
                                            "Irregular leaf edges",
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
                                            "Chewed or damaged foliage",
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
                                            "Presence of caterpillar silk threads",
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
                                            "Leaf defoliation",
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
                                              image: AssetImage(CImages.cci5),
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
                                            "Poor sanitation practices",
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
                                            "Presence of other infested plants nearby",
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
                                            "Favorable environmental conditions",
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
                                            "Lack of natural predators",
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
                                            "Overuse of chemicals leading to resistance",
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
                                            "Infected planting material",
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
                                              image: AssetImage(CImages.cci6),
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
                                        'Treatment:',
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
                                            "Manual removal of caterpillars",
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
                                            "Biological control using natural predators",
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
                                            "Application of botanical insecticides",
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
                                            "Cultural practices as pruning affected parts",
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
                                            "Use of chemical pesticides as a last resort",
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
                                            "Application of microbial insecticides",
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
                                              image: AssetImage(CImages.cci7),
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
                                        'Pesticides:',
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
                                            "Neem oil (natural)",
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
                                            "Bacillus thuringiensis (Bt) (natural)",
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
                                            "Spinosad (natural)",
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
                                            "Chlorpyrifos (chemical)",
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
                                            "Cypermethrin (chemical)",
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
                                            "Carbaryl (chemical)",
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
                                              image: AssetImage(CImages.cci8),
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
                                            "Regular inspection of coconut trees",
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
                                            "Use of pheromone traps for monitoring",
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
                                            "Intercropping with repellent plants",
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
                                            "Pruning of affected branches",
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
                                            "Application of biopesticides",
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
                                            "Implementing pest management strategies",
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
                                              image: AssetImage(CImages.cci9),
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
                              'https://youtu.be/ZLxyOFtA1nw?si=k_8CPGPuedNUrbDo'),
                          child: const Text(
                            'Learn more about CCI on YouTube',
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
        CImages.cci1,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.cci2,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.cci3,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.cci4,
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
