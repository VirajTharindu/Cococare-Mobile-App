import 'package:cloud_firestore/cloud_firestore.dart';

class TrackingDataModel {
  final String id;
  final double diseaseSpreadRate;
  final String diseasespreadComment;
  final double severitySymptomsRate;
  final String severitySymptomsComment;
  final double controllingMeasuresRate;
  final String controllingMeasuresComment;
  final double impactYieldRate;
  final String impactYieldComment;
  final double environmentalConditionsRate;
  final String environmentalConditionsComment;

  TrackingDataModel({
    required this.id,
    required this.diseaseSpreadRate,
    required this.diseasespreadComment,
    required this.severitySymptomsRate,
    required this.severitySymptomsComment,
    required this.controllingMeasuresRate,
    required this.controllingMeasuresComment,
    required this.impactYieldRate,
    required this.impactYieldComment,
    required this.environmentalConditionsRate,
    required this.environmentalConditionsComment,
  });

  //static function to create an empty model
  static TrackingDataModel empty() {
    return TrackingDataModel(
      id: '',
      diseaseSpreadRate: 0.0,
      diseasespreadComment: '',
      severitySymptomsRate: 0.0,
      severitySymptomsComment: '',
      controllingMeasuresRate: 0.0,
      controllingMeasuresComment: '',
      impactYieldRate: 0.0,
      impactYieldComment: '',
      environmentalConditionsRate: 0.0,
      environmentalConditionsComment: '',
    );
  }

  // Convert model to JSON structure for storage in Firebase
  Map<String, dynamic> toJson() {
    return {
      'diseaseSpreadRate': diseaseSpreadRate,
      'diseasespreadComment': diseasespreadComment,
      'severitySymptomsRate': severitySymptomsRate,
      'severitySymptomsComment': severitySymptomsComment,
      'controllingMeasuresRate': controllingMeasuresRate,
      'controllingMeasuresComment': controllingMeasuresComment,
      'impactYieldRate': impactYieldRate,
      'impactYieldComment': impactYieldComment,
      'environmentalConditionsRate': environmentalConditionsRate,
      'environmentalConditionsComment': environmentalConditionsComment,
    };
  }

  // Factory method to create a TrackingDataModel from a Firebase document snapshot
  factory TrackingDataModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TrackingDataModel(
      id: document.id,
      diseaseSpreadRate: data['diseaseSpreadRate'] ?? 0.0,
      diseasespreadComment: data['diseasespreadComment'] ?? '',
      severitySymptomsRate: data['severitySymptomsRate'] ?? 0.0,
      severitySymptomsComment: data['severitySymptomsComment'] ?? '',
      controllingMeasuresRate: data['controllingMeasuresRate'] ?? 0.0,
      controllingMeasuresComment: data['controllingMeasuresComment'] ?? '',
      impactYieldRate: data['impactYieldRate'] ?? 0.0,
      impactYieldComment: data['impactYieldComment'] ?? '',
      environmentalConditionsRate: data['environmentalConditionsRate'] ?? 0.0,
      environmentalConditionsComment:
          data['environmentalConditionsComment'] ?? '',
    );
  }
}
