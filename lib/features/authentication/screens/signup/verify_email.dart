import 'package:coconut_disease_detection/common/success_screen.dart';
import 'package:coconut_disease_detection/data/repositories/authentication/authentication_repository.dart';
import 'package:coconut_disease_detection/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:coconut_disease_detection/features/authentication/screens/login/login.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:coconut_disease_detection/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        //default equal space for all sides in padding
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              //image
              Image(
                image: const AssetImage(CImages.serviceIlustration1),
                width: CHelperFunctions.screenWidth() * 0.9,
              ),
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              //title & subtitle
              Text(
                CTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              Text(CTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              //buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerifictionStatus(),
                    child: const Text(CTexts.ccontinue)),
              ),
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text(CTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
