import 'package:coconut_disease_detection/features/authentication/controllers/signup/signup_controller.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:coconut_disease_detection/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class terms extends StatelessWidget {
  const terms({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = CHelperFunctions.isDarkMode(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.black,
              ),
              child: Checkbox(
                value: controller.termsprivacy.value,
                onChanged: (value) => controller.termsprivacy.value =
                    !controller.termsprivacy.value,
                side: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(width: CSizes.spaceBtwItems),
        Expanded(
          // Add this to make the text wrap and fit available space
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                text: '${CTexts.isAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${CTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? CColors.white : CColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? CColors.white : CColors.primaryColor,
                    ),
              ),
              TextSpan(
                text: '${CTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: CTexts
                    .termsConditions, // Removed the extra space before the text
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? CColors.white : CColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? CColors.white : CColors.primaryColor,
                    ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
