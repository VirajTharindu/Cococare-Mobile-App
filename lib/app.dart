import 'package:coconut_disease_detection/bindings/general_binding.dart';
import 'package:coconut_disease_detection/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:coconut_disease_detection/utils/theme/theme.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coconut Disease Detection',
      themeMode: ThemeMode.system,
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      initialBinding: GeneralBinding(),
      home: const OnBoardingScreen(),
    );
  }
}
