import 'package:coconut_disease_detection/features/authentication/screens/disease_detect/disease_detect.dart';
import 'package:coconut_disease_detection/features/authentication/screens/disease_list/disease_list.dart';
import 'package:coconut_disease_detection/features/authentication/screens/diseases/stem_bleeding.dart';
import 'package:coconut_disease_detection/features/authentication/screens/home/home.dart';
import 'package:coconut_disease_detection/features/authentication/screens/result/result.dart';
import 'package:coconut_disease_detection/features/authentication/screens/tracking_report/tracking_report.dart';
import 'package:coconut_disease_detection/features/personalization/screens/profile.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? CColors.black : CColors.white,
          shadowColor: CColors.grey.withOpacity(0.7),
          //ndicatorColor: darkMode ? CColors.white.withOpacity(0.1) : CColors.black.withOpacity(0.1),

          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.additem), label: 'Add'),
            NavigationDestination(
                icon: Icon(Iconsax.information), label: 'Support'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const DiseaseDetect(),
    const Result(),
    const DiseaseList(),
    const ProfileScreen(),
  ];
}
