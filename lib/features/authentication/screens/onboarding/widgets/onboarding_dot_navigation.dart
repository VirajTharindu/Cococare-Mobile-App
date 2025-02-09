import 'package:coconut_disease_detection/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/device/device_utility.dart';
import 'package:coconut_disease_detection/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingdotNavigation extends StatelessWidget {
  const OnboardingdotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBordingController.instance;

    final dark = CHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: CDeviceUtils.getBottomNavigationBarHeight() + 25.0,
      left: CSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? CColors.light : CColors.dark, dotHeight: 6),
      ),
    );
  }
}
