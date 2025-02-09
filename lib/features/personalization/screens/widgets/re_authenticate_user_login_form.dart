import 'package:coconut_disease_detection/features/personalization/controllers/user_controller.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:coconut_disease_detection/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateUserLoginForm extends StatelessWidget {
  const ReAuthenticateUserLoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Re-Authenticate User'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: CValidator.validateEmail,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: CTexts.email,
                    ),
                  ),

                  //password
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) =>
                          CValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: CTexts.password,
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: const Icon(Iconsax.eye_slash),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: CSizes.spaceBtwSections),

                  //login button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          controller.reAuthenticateEmailAndPasswordUser(),
                      child: const Text('Re-Authenticate'),
                    ),
                  ),
                ],
              )),
        )));
  }
}
