import 'package:coconut_disease_detection/data/repositories/authentication/authentication_repository.dart';
import 'package:coconut_disease_detection/data/repositories/tracking/tracking_repository.dart';
import 'package:coconut_disease_detection/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // Initialize UserController instance
  Get.put(UserController());

  // Initialize TrackingRepository as a singleton
  Get.put(TrackingRepository());

  runApp(const MyApp());
}
