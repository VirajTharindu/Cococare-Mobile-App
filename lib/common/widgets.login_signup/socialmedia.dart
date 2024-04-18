import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';

class Csocialmedia extends StatelessWidget {
  const Csocialmedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: CColors.grey),
            borderRadius: BorderRadius.circular(100)),
        child: IconButton(
          onPressed: () {},
          icon: const Image(
            width: CSizes.iconMd,
            height: CSizes.iconMd,
            image: AssetImage(CImages.googleLogo),
          ),
        ),
      ),
      const SizedBox(width: CSizes.spaceBtwItems),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: CColors.grey),
            borderRadius: BorderRadius.circular(100)),
        child: IconButton(
          onPressed: () {},
          icon: const Image(
            width: CSizes.iconMd,
            height: CSizes.iconMd,
            image: AssetImage(CImages.facebookLogo),
          ),
        ),
      ),
    ]);
  }
}
