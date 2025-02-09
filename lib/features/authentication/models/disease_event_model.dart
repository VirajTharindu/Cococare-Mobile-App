import 'package:flutter/material.dart';

class DiseaseEventModel {
  final String id;
  final String diseaseName;
  final String dateTime;

  DiseaseEventModel({
    required this.id,
    required this.diseaseName,
    required this.dateTime,
  });

  // Factory method to create a DiseaseEventModel from a Map
  factory DiseaseEventModel.fromJson(Map<String, dynamic> json) {
    return DiseaseEventModel(
      id: json['id'],
      diseaseName: json['diseaseName'],
      dateTime: json['dateTime'],
    );
  }

  // Method to convert DiseaseEventModel to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'diseaseName': diseaseName,
      'dateTime': dateTime,
    };
  }
}
