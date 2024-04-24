import 'dart:io';
import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for launching URLs

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  File? _pickedImage;
  String _disease = "Disease"; // Default disease information
  String _accuracy = "Accuracy"; // Default accuracy information

//void _fetchDataFromOperation() {
  // Replace this with your logic to fetch both image and disease/accuracy information
  // For example:
  // final fetchedData = _fetchDataFromOperation();
//
  // setState(() {
  // if (fetchedData != null) {
  // _pickedImage = fetchedData['image'];
  // _disease = fetchedData['disease'];
  // _accuracy = fetchedData['accuracy'];
  // }
  // });
  //}

  //String _getControllingMeasuresContent() {
  // Implement  logic to determine the content dynamically
  // For demonstration purposes, let's say the content depends on a boolean variable
  //bool showFirstContent = true;

  //if (showFirstContent) {
  //return "First controlling measure: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
  //} else {
  //return "Second controlling measure: Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
  ///}
  // }

  // Update _pickImage method to load image from operation
  //Future<void> _pickImageFromOperation() async {

  // Replace this with logic to load the image from an operation
  // For example:
  //final File imageFile = await loadImageFromOperation();

  //setState(() {
  // if (imageFile != null) {
  //_pickedImage = imageFile;
  //  }
  // });
  // }

  // @override
  //void initState() {
  // super.initState();
  // _fetchDataFromOperation(); // Fetch data when the widget initializes
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        title: Text('Result'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: _pickedImage != null
                  ? Image.file(File(
                      _pickedImage!.path)) // Display dynamically loaded image
                  : Container(
                      // Placeholder before image selection
                      height: 200,
                      width: 360,
                      decoration: BoxDecoration(
                        color: CColors.grey.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "No image is Displayed!",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            Center(
              child: Container(
                height: 100,
                width: 360,
                decoration: BoxDecoration(
                  color: CColors.grey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  // Use Column for vertical stacking
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Align content to the left
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 250),
                      child: Text(
                        'disease:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0), // Optional spacing between titles
                    Padding(
                      padding: EdgeInsets.only(right: 250),
                      child: Text(
                        'accuracy:', // Replace with actual disease data
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            Center(
                child: Container(
              height: 400,
              width: 360,
              decoration: BoxDecoration(
                color: CColors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // Use Column for vertical stacking
                children: const [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Controlling measures:", // Update title
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //content for controlling measures
                  //Padding(
                  //padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //child: Text(
                  //_getControllingMeasuresContent(), // Dynamically display content
                  // style: const TextStyle(fontSize: 14.0),
                  // ),
                  // ),
                ],
              ),
            )),

            const SizedBox(height: CSizes.spaceBtwItems),

            // Link for "Need more information?"
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () async {
                    const url =
                        'https://vikaspedia.in/agriculture/crop-production/integrated-pest-managment/ipm-strategies-for-coconut/diseases-and-symptoms'; // Replace with relevant URL
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 18),
                    child: Text(
                      'Need more information?',
                      style: TextStyle(
                        color: CColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: CSizes.spaceBtwItems)
          ],
        ),
      ),
    );
  }
}
