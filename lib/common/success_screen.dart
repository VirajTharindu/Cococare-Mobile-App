import 'package:coconut_disease_detection/common/styles/spacing_styles.dart';
import 'package:coconut_disease_detection/features/authentication/screens/login/login.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:coconut_disease_detection/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: CSpaceingStyle.paddingWithAppBarHeight * 2,
        child: SizedBox(
          child: Column(
            children: [
              //image
              //Lottie.asset(image,
              //width: MediaQuery.of(context).size.width * 0.6),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              //title & subtitle
              Text(
                CTexts.accountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              Text(CTexts.accountCreatedSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    child: const Text(CTexts.ccontinue)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
