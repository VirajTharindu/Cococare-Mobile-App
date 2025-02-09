import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/common/notification/notification.dart';
import 'package:coconut_disease_detection/common/shimmer.dart';
import 'package:coconut_disease_detection/features/personalization/controllers/user_controller.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CHomeAppBar extends StatelessWidget {
  const CHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: CColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              //display a shimmer loader while user profile is being loaded
              return const CShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: CColors.white));
            }
          }),
        ],
      ),
      actions: [
        CNotificationIcon(
          onPressed: () {},
          iconColor: CColors.white,
        )
      ],
    );
  }
}
