import 'package:coconut_disease_detection/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:coconut_disease_detection/features/authentication/screens_onboarding/widgets/onboading_skip.dart';
import 'package:coconut_disease_detection/features/authentication/screens_onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:coconut_disease_detection/features/authentication/screens_onboarding/widgets/onboarding_next_button.dart';
import 'package:coconut_disease_detection/features/authentication/screens_onboarding/widgets/onboarding_page.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:coconut_disease_detection/utils/device/device_utility.dart';
import 'package:coconut_disease_detection/utils/helpers/helper_functions.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBordingController());

    return Scaffold(
      body: Stack(
        children: [
          ///horizontal scroll pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: CImages.lightAppLogo,
                title: CTexts.onboardingTitle1,
                subtitle: CTexts.onboardingSubtitle1,
              ),
              OnboardingPage(
                image: CImages.onboardingAsset2,
                title: CTexts.onboardingTitle2,
                subtitle: CTexts.onboardingSubtitle2,
              ),
              OnboardingPage(
                image: CImages.onboardingAsset3,
                title: CTexts.onboardingTitle3,
                subtitle: CTexts.onboardingSubtitle3,
              ),
            ],
          ),

          //skip button
          const OnboardingSkip(),

          //dot navigation smoothpageindicator
          const OnboardingdotNavigation(),

          //circular button
          const OnboardingNextButton(),
        ],
      ),
    );
  }
}
