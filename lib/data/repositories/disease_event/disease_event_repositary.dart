import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coconut_disease_detection/features/authentication/models/disease_event_model.dart';
import 'package:coconut_disease_detection/utils/exceptions/firebase_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/format_exceptions.dart';
import 'package:coconut_disease_detection/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class DiseaseEventRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<int> getDiseaseEventCount() async {
    try {
      QuerySnapshot querySnapshot = await db.collection('DiseaseEvents').get();
      return querySnapshot.docs.length;
    } catch (e) {
      throw 'Error getting disease event count: $e';
    }
  }

  Future<void> saveDiseaseEvent(DiseaseEventModel diseaseEvent) async {
    try {
      if (kDebugMode) {
        print('Saving diseaseEvent record...');
      }

      await db
          .collection("DiseaseEvents")
          .doc(diseaseEvent.id)
          .set(diseaseEvent.toJson());

      if (kDebugMode) {
        print('diseaseEvent record saved successfully!');
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
}
