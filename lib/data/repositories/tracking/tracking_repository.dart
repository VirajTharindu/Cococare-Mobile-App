import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coconut_disease_detection/features/authentication/models/tracking_model.dart';
import 'package:coconut_disease_detection/utils/exceptions/firebase_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/format_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TrackingRepository extends GetxController {
  static TrackingRepository get instance => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  //functions to save user data to firestore
  Future<void> saveTrackingRecord(TrackingDataModel tracking) async {
    try {
      if (kDebugMode) {
        print('Saving tracking record...');
      }

      await db.collection("Tracking").doc(tracking.id).set(tracking.toJson());

      if (kDebugMode) {
        print('Tracking record saved successfully!');
      }
    } on FirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CFormatException();
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('Something went wrong! Please try again later! : $e');
      }
    }
  }

  //function to fetch user details based on user ID
  Future<List<TrackingDataModel>> fetchTrackingData() async {
    try {
      if (kDebugMode) {
        print('Fetching tracking data...');
      } // Added for debugging

      final querySnapshot = await db
          .collection('Tracking')
          .get(); // Collection might be 'Tracking'

      if (kDebugMode) {
        print('Fetched ${querySnapshot.docs.length} tracking documents');
      } // Added for debugging

      return querySnapshot.docs
          .map((doc) => TrackingDataModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CFormatException();
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again later.';
    }
  }

  // Function to fetch spread ratings & tracking id's from start to end of Firebase Firestore
  Future<List<Map<String, dynamic>>> fetchSpreadRatings() async {
    try {
      final querySnapshot = await db.collection('Tracking').get();

      List<Map<String, dynamic>> spreadRatings = querySnapshot.docs
          .map((doc) => {
                'trackingId': doc.id,
                'spreadRating':
                    TrackingDataModel.fromSnapshot(doc).diseaseSpreadRate,
              })
          .toList();

      return spreadRatings;
    } catch (e) {
      throw e.toString();
    }
  }
}
