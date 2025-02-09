import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

class Cform_divider extends StatelessWidget {
  const Cform_divider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: dark ? CColors.darkgrey : CColors.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5),
        ),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
              color: dark ? CColors.darkgrey : CColors.grey,
              thickness: 0.5,
              indent: 5,
              endIndent: 60),
        ),
      ],
    );
  }
}
