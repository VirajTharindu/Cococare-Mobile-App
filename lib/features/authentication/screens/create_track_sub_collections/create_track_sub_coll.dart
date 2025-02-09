import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/features/authentication/screens/disease_event_form/disease_event_form.dart';
import 'package:coconut_disease_detection/features/authentication/screens/disease_event_list/disease_event_list.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Create_Track_Sub_Coll extends StatelessWidget {
  const Create_Track_Sub_Coll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: Text("Create Disease Events for Tracking"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 75,
                margin: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () =>
                      // Navigate to the new screen
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Disease_Event_Form()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
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
                  child: const Text("Create a New"),
                ),
              ),
              SizedBox(
                width: 180,
                height: 75,
                child: ElevatedButton(
                  onPressed: () =>
                      // Navigate to the new screen
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Disease_Event_List()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Light grey background
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
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
                  child: const Text(
                    "Move to Existing",
                    style: TextStyle(color: CColors.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
