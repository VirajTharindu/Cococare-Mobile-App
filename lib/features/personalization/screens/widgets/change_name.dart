import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/features/personalization/controllers/update_name_controller.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:coconut_disease_detection/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(

        //custom appbar
        appBar: CAppBar(
          showBackArrow: true,
          title: Text('Change Name',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //headings
                Text(
                  'Use real name for easy verification, This name will apear on several pages.',
                  style: Theme.of(context).textTheme.labelMedium,
                ),

                const SizedBox(height: CSizes.spaceBtwSections),

                //text field & button
                Form(
                    key: controller.updateUserNameFormKey,
                    child: SizedBox(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.firstName,
                            validator: (value) => CValidator.validateEmptyText(
                                'First Name', value),
                            expands: false,
                            decoration: const InputDecoration(
                                labelText: CTexts.firstName,
                                prefixIcon: Icon(Iconsax.user)),
                          ),
                          const SizedBox(height: CSizes.spaceBtwInputFields),
                          TextFormField(
                            controller: controller.lastName,
                            validator: (value) => CValidator.validateEmptyText(
                                'Last Name', value),
                            expands: false,
                            decoration: const InputDecoration(
                                labelText: CTexts.lastName,
                                prefixIcon: Icon(Iconsax.user)),
                          ),
                        ],
                      ),
                    )),

                const SizedBox(height: CSizes.spaceBtwSections),

                //save button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.updateUserName(),
                      child: const Text('save')),
                ),
              ],
            ),
          ),
        ));
  }
}
