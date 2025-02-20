import 'package:coconut_disease_detection/bindings/general_binding.dart';
import 'package:coconut_disease_detection/features/authentication/screens/analyzing/analyzing.dart';
import 'package:coconut_disease_detection/features/authentication/screens/disease_detect/disease_detect.dart';
import 'package:coconut_disease_detection/features/authentication/screens/disease_event_form/disease_event_form.dart';
import 'package:coconut_disease_detection/features/authentication/screens/disease_event_list/disease_event_list.dart';
import 'package:coconut_disease_detection/features/authentication/screens/diseases/bud_rot.dart';
import 'package:coconut_disease_detection/features/authentication/screens/diseases/coconut_catapilar.dart';
import 'package:coconut_disease_detection/features/authentication/screens/diseases/grey_leaf_spot.dart';
import 'package:coconut_disease_detection/features/authentication/screens/diseases/leaf_rot.dart';
import 'package:coconut_disease_detection/features/authentication/screens/diseases/stem_bleeding.dart';
import 'package:coconut_disease_detection/features/authentication/screens/onboarding/onboarding.dart';
import 'package:coconut_disease_detection/features/authentication/screens/tracking/tracking.dart';
import 'package:coconut_disease_detection/features/authentication/screens/tracking_report/tracking_report.dart';
import 'package:coconut_disease_detection/features/authentication/screens/create_track_sub_collections/create_track_sub_coll.dart';
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

        //define routes for every disease screen
        routes: {
          '/cci': (context) => const Coconut_Catapilar(),
          '/bud_rot': (context) => const Bud_Rot(),
          '/leaf_rot': (context) => const Leaf_Rot(),
          '/grey_leaf': (context) => const Grey_Leaf_Spot(),
          '/stem_bleeding': (context) => const Stem_bleeding(),
          '/tracking': (context) => const Tracking(),
          '/trackingReport': (context) => const TrackingReport(),
          '/analyzing': (context) => const Analyzing(),
          '/create_track_sub_coll': (context) => const Create_Track_Sub_Coll(),
          '/disease_event_list': (context) => const Disease_Event_List(),
          '/disease_event_form': (context) => const Disease_Event_Form(),
          '/disease_detect': (context) => const DiseaseDetect(),
        });
  }
}
