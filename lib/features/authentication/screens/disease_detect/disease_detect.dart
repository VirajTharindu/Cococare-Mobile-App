import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/common/section_heading.dart';
import 'package:coconut_disease_detection/features/authentication/screens/tracking/tracking.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DiseaseDetect extends StatelessWidget {
  const DiseaseDetect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: Text("Disease Detection"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Container with icons and button
          Center(
            child: Container(
              height: 200,
              width: 360,
              decoration: BoxDecoration(
                color: CColors.grey
                    .withOpacity(0.7), // Set your desired grey color
                borderRadius:
                    BorderRadius.circular(20.0), // Adjust for desired roundness
              ),
              child: Column(
                children: [
                  // Row for icons and text labels
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround, // Distribute evenly
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0,
                            bottom: 10.0), // Adjust padding as needed
                        child: Column(
                          mainAxisSize:
                              MainAxisSize.min, // Adjust size (optional)
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Iconsax.camera,
                                  size: 45.0), // Larger camera icon
                              color: Colors.black,
                            ),
                            const Text("Take a Photo",
                                style: TextStyle(
                                    fontSize: 14.0, color: CColors.black)),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.arrow_right_3,
                            size: 40.0), // Arrow icon (ignored)
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0,
                            bottom: 10.0), // Adjust padding as needed
                        child: Column(
                          mainAxisSize:
                              MainAxisSize.min, // Adjust size (optional)
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Iconsax.gallery,
                                  size: 45.0), // Larger gallery icon
                              color: Colors.black,
                            ),
                            const Text("Upload It",
                                style: TextStyle(fontSize: 14.0)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Spacer for vertical space between icons and button

                  // Padding for button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CColors.primaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 150,
                          vertical: 20,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Match container radius
                        ),
                      ),
                      child: const Text("Scan"),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: CSizes.spaceBtwItems),
          const Divider(),
          const SizedBox(height: CSizes.spaceBtwItems),
          Row(
            // Wrap heading with spacers
            children: const [
              Spacer(), // Spacer for left alignment
              CSectionHeading(
                title: 'DashBoard',
                showActionButton: false,
              ),
              Spacer(), // Spacer for right alignment
            ],
          ),
          const SizedBox(height: CSizes.spaceBtwItems),

          // New section for four rounded buttons
          Container(
            height: 360.0, // Adjust height as needed
            width: 360.0, // Adjust width as needed
            decoration: BoxDecoration(
              color: CColors.grey.withOpacity(0.7), // Set background color
              borderRadius: BorderRadius.circular(20.0),
            ),

            //2nd container
            child: _buildFourButtonGrid(context), // Call the new function
          ),
        ]),
      ),
    );
  }
}

Widget _buildFourButtonGrid(BuildContext context) {
  return GridView.count(
      crossAxisCount: 2, // Two buttons per row
      childAspectRatio: 1.0, // Aspect ratio for square buttons
      mainAxisSpacing: 10.0, // Spacing between rows
      crossAxisSpacing: 10.0, // Spacing between buttons
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: CColors.lightgrey,
            foregroundColor: CColors.primaryColor,
            side: BorderSide(color: CColors.grey.withOpacity(0.7)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Iconsax.message_tick, size: 30.0, color: Colors.black),
              SizedBox(height: 5.0),
              Text("Messaging",
                  style: TextStyle(fontSize: 12.0, color: CColors.darkergrey)),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: CColors.lightgrey,
            foregroundColor: CColors.primaryColor,
            side: BorderSide(color: CColors.grey.withOpacity(0.7)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Iconsax.shield_search, size: 30.0, color: Colors.black),
              SizedBox(height: 5.0),
              Text(
                "Controlling Measures",
                style: TextStyle(fontSize: 12.0, color: CColors.darkergrey),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () =>
              // Navigate to the tracking screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Tracking())),
          style: ElevatedButton.styleFrom(
            backgroundColor: CColors.lightgrey,
            foregroundColor: CColors.primaryColor,
            side: BorderSide(color: CColors.grey.withOpacity(0.7)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Iconsax.note_2, size: 30.0, color: Colors.black),
              SizedBox(height: 5.0),
              Text("Tracking",
                  style: TextStyle(fontSize: 12.0, color: CColors.darkergrey)),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: CColors.lightgrey,
              foregroundColor: CColors.primaryColor,
              side: BorderSide(color: CColors.grey.withOpacity(0.7)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: const EdgeInsets.all(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Iconsax.user, size: 30.0, color: Colors.black),
                SizedBox(height: 5.0),
                Text("User Profile",
                    style:
                        TextStyle(fontSize: 12.0, color: CColors.darkergrey)),
              ],
            ))
      ]);
}
