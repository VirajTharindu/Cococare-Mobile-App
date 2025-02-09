import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Bud_Rot extends StatelessWidget {
  const Bud_Rot({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: Text('Coconut Bud Rot'),
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
              'Bud Rot', // Heading text
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'Phytophthora palmivora', // Subtitle text
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
                                            "Wilting or drooping of young leaves",
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
                                            "Discoloration or yellowing of foliage",
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
                                            "Foul odor emanating from affected buds",
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
                                            "Softening or rotting of the bud tissue",
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
                                            "Presence of dark or brown lesions on buds",
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
                                            "Premature shedding of affected fronds",
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
                                              image: AssetImage(CImages.br6),
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
                                            "Fungal pathogens like Phytophthora palmivora",
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
                                            "Waterlogged or poorly drained soil conditions",
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
                                            "High humidity and wet weather",
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
                                            "Improper cultural practicesas overwatering",
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
                                            "Mechanical injury to bud tissues",
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
                                            "Infestation by pests like beetles or borers",
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
                                              image: AssetImage(CImages.br7),
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
                                            "Fungicides like metalaxyl or phosphorous acid",
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
                                            "Proper drainage to reduce waterlogging",
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
                                            "Soil amendments to improve soil and drainage",
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
                                            "Removal of infected plant to prevent spread",
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
                                            "Pruning to improve air & reduce humidity",
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
                                            "Using of biocontrol agent like Trichoderma spp",
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
                                              image: AssetImage(CImages.br8),
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
                                            "Copper-based fungicides: Effective",
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
                                            "Plant extracts: Cinnamon oil",
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
                                            "Bordeaux mixture: Combats fungal infections.",
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
                                            "Biological fungicides: Bacillus lives pathogens",
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
                                            "Neem oil: Natural antifungal solution",
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
                                            "Garlic extract: Antimicrobial properties",
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
                                              image: AssetImage(CImages.br9),
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
                                            "Proper drainage: Prevents waterlogging in soil.",
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
                                            "Pruning: Remove affected parts promptly.",
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
                                            "Sanitation: Clean tools to prevent spread.",
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
                                            "Monitor humidity: Avoid damp conditions.",
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
                                            "Mulching: Regulates soil moisture levels.",
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
                                            "Fungicide applications: Regular treatments",
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
                                              image: AssetImage(CImages.br10),
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
                              'https://youtu.be/M7-LjeRsZ7o?si=2_kO0e_mGnCUmBKg'),
                          child: const Text(
                            'Learn more about Bud Rot on YouTube',
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
        CImages.br2,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.br3,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.br4,
        fit: BoxFit.cover,
      ),
      Image.asset(
        CImages.br5,
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
