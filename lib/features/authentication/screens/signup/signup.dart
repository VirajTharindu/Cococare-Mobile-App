import 'package:coconut_disease_detection/common/widgets.login_signup/form_divider.dart';
import 'package:coconut_disease_detection/common/widgets.login_signup/socialmedia.dart';
import 'package:coconut_disease_detection/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              //Title
              Text(
                CTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: CSizes.spaceBtwSections),

              //Form
              const signup_form(),
              const SizedBox(height: CSizes.spaceBtwSections),

              //divider
              Cform_divider(dividerText: CTexts.orsignupWith.capitalize!),
              const SizedBox(height: CSizes.spaceBtwSections),

              //social medial
              const Csocialmedia(),
              const SizedBox(height: CSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
