import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/common/section_heading.dart';
import 'package:coconut_disease_detection/common/shimmer.dart';
import 'package:coconut_disease_detection/features/personalization/controllers/user_controller.dart';
import 'package:coconut_disease_detection/features/personalization/screens/widgets/change_name.dart';
import 'package:coconut_disease_detection/features/personalization/screens/widgets/profile_menu.dart';
import 'package:coconut_disease_detection/utils/constants/CCircularImage.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/image_strings.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
        appBar: const CAppBar(
          showBackArrow: true,
          title: Text("Profile"),
        ),

        //body
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: Column(
              children: [
                //profile image
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : CImages.user;

                        return controller.imageUploading.value
                            ? const CShimmerEffect(
                                width: 80, height: 80, radius: 80)
                            : CCircularImage(
                                image: image,
                                width: 80,
                                height: 80,
                                isNetworkImage: networkImage.isNotEmpty);
                      }),
                      TextButton(
                          onPressed: () =>
                              controller.UploadUserProfilePicture(),
                          child: const Text(
                            'Change Profile Photo',
                            style: TextStyle(color: CColors.darkergrey),
                          )),
                    ],
                  ),
                ),

                //details
                const SizedBox(height: CSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: CSizes.spaceBtwItems),

                //heading profile info
                const CSectionHeading(
                    title: 'Profile Information', showActionButton: false),
                const SizedBox(height: CSizes.spaceBtwItems),

                profile_menu(
                    title: 'Name',
                    value: controller.user.value.fullName,
                    onPressed: () => Get.to(() => const ChangeName())),
                profile_menu(
                    title: 'Username',
                    value: controller.user.value.userName,
                    onPressed: () {}),

                const SizedBox(height: CSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: CSizes.spaceBtwItems),

                //heading personal information
                const CSectionHeading(
                    title: 'Personal Information', showActionButton: false),
                const SizedBox(height: CSizes.spaceBtwItems),

                profile_menu(
                    title: 'UserID',
                    value: controller.user.value.id,
                    icon: Iconsax.copy,
                    onPressed: () {}),
                profile_menu(
                    title: 'National-ID',
                    value: controller.user.value.nationalID,
                    onPressed: () {}),
                profile_menu(
                    title: 'E-mail',
                    value: controller.user.value.email,
                    onPressed: () {}),
                profile_menu(
                    title: 'Phone Number',
                    value: controller.user.value.phoneNumber,
                    onPressed: () {}),
                profile_menu(
                    title: 'Address',
                    value: controller.user.value.address,
                    onPressed: () {}),

                const Divider(),
                const SizedBox(height: CSizes.spaceBtwItems),

                Center(
                  child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text(
                        'Close Profile',
                        style: TextStyle(color: Colors.red),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
