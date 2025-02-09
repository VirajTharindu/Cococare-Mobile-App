import 'package:coconut_disease_detection/features/authentication/controllers/login/login_controlling.dart';
import 'package:coconut_disease_detection/features/authentication/controllers/signup/signup_controller.dart';
import 'package:coconut_disease_detection/features/authentication/screens/signup/signup.dart';
import 'package:coconut_disease_detection/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';

class Clogin_form extends StatelessWidget {
  const Clogin_form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSections),
        child: Column(
          children: [
            ///email
            TextFormField(
              controller: controller.email,
              validator: (Value) => CValidator.validateEmail(Value),
              decoration: const InputDecoration(
                labelText: CTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwInputFields),

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

            const SizedBox(height: CSizes.spaceBtwInputFields / 2),

            ///remember me & forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        activeColor: Theme.of(context).primaryColor,

                        // Set the border color to grey explicitly
                        side: const BorderSide(color: Colors.grey),

                        value: controller.rememberMe.value,

                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(CTexts.rememberMe),
                  ],
                ),

                ///forgot password
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    CTexts.forgotPassword,
                  ),
                )
              ],
            ),

            const SizedBox(height: CSizes.spaceBtwSections),

            ///login in button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(CTexts.login))),

            const SizedBox(height: CSizes.spaceBtwItems),

            ///sign up button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(CTexts.signUpButton))),
          ],
        ),
      ),
    );
  }
}
