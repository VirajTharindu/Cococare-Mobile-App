import 'package:coconut_disease_detection/features/authentication/controllers/signup/signup_controller.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:coconut_disease_detection/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class terms extends StatelessWidget {
  const terms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = CHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor:
                    Colors.black, // Change the outline color to black
              ),
              child: Checkbox(
                value: controller.termsprivacy.value,
                onChanged: (value) => controller.termsprivacy.value =
                    !controller.termsprivacy.value,
                // Set the border color to grey explicitly
                side: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(width: CSizes.spaceBtwItems),
        Text.rich(
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
              text: ' ${CTexts.termsConditions}',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? CColors.white : CColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        dark ? CColors.white : CColors.primaryColor,
                  ),
            ),
          ]),
        ),
      ],
    );
  }
}
