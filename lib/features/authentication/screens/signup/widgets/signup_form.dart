import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:coconut_disease_detection/features/authentication/controllers/signup/signup_controller.dart';
import 'package:coconut_disease_detection/features/authentication/screens/signup/widgets/terms.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:coconut_disease_detection/utils/validators/validation.dart';

class signup_form extends StatelessWidget {
  const signup_form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                //1st name
                Expanded(
                  child: TextFormField(
                    controller: controller.firstname,
                    validator: (value) =>
                        CValidator.validateEmptyText('First Name', value),
                    decoration: const InputDecoration(
                      labelText: CTexts.firstname,
                      prefixIcon: Icon(Iconsax.user),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: CSizes.spaceBtwInputFields),

                //last name
                Expanded(
                  child: TextFormField(
                    controller: controller.lastname,
                    validator: (value) =>
                        CValidator.validateEmptyText('Last Name', value),
                    decoration: const InputDecoration(
                      labelText: CTexts.lastname,
                      prefixIcon: Icon(Iconsax.user),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: CSizes.spaceBtwInputFields),

            //user name
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  CValidator.validateEmptyText('User Name', value),
              decoration: const InputDecoration(
                labelText: CTexts.username,
                prefixIcon: Icon(Iconsax.user_edit),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwInputFields),

            //national ID
            TextFormField(
              controller: controller.nationalID,
              validator: (value) => CValidator.validateNationalID(value),
              decoration: const InputDecoration(
                labelText: CTexts.nationalID,
                prefixIcon: Icon(Iconsax.card),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwInputFields),

            //email
            TextFormField(
              controller: controller.email,
              validator: (value) => CValidator.validateEmail(value),
              decoration: const InputDecoration(
                labelText: CTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwInputFields),

            //phone number
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => CValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                labelText: CTexts.phoneNumber,
                prefixIcon: Icon(Iconsax.call),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwInputFields),

            //address
            TextFormField(
              controller: controller.address,
              validator: (value) => CValidator.validateAddress(value),
              decoration: const InputDecoration(
                labelText: CTexts.address,
                prefixIcon: Icon(Iconsax.location),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwInputFields),

            //password
            Obx(
              () {
                bool hidePassword = controller.hidePassword.value;
                return TextFormField(
                  controller: controller.password,
                  validator: (value) => CValidator.validatePassword(value),
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: CTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () {
                        hidePassword = !hidePassword;
                        controller.hidePassword.value = hidePassword;
                      },
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                );
              },
            ),

            const SizedBox(height: CSizes.spaceBtwInputFields),

            //terms & conditions checkbox
            const terms(),
            const SizedBox(height: CSizes.spaceBtwSections),

            //sign up button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(CTexts.signUpButton),
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
