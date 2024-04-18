import 'package:coconut_disease_detection/common/styles/spacing_styles.dart';
import 'package:coconut_disease_detection/common/widgets.login_signup/form_divider.dart';
import 'package:coconut_disease_detection/common/widgets.login_signup/socialmedia.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:coconut_disease_detection/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:coconut_disease_detection/features/authentication/screens/login/widgets/login_header.dart';
import 'package:coconut_disease_detection/features/authentication/screens/login/widgets/login_form.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CSpaceingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///logo, title & subtitle
              Clogin_header(dark: dark),

              ///form
              const Clogin_form(),

              ///Divider
              Cform_divider(dividerText: CTexts.orsigninWith.capitalize!),

              const SizedBox(height: CSizes.spaceBtwItems),

              ///Footer
              const Csocialmedia()
            ],
          ),
        ),
      ),
    );
  }
}
