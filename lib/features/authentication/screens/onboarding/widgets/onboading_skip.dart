import 'package:coconut_disease_detection/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: CDeviceUtils.getAppBarHeight(),
        right: CSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBordingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
