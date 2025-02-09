//list of enums
//can not be created inside a class

enum TextSizes { small, medium, large }

enum DetectionStatus {
  pending,
  processing,
  scanned,
  detected,
  notDetected,
  failed
}

//types of diseases
enum CoconutDisease { budRot, cci, greyLeafSpot, leafRot, stemBleeding }

//types of severity
enum DiseaseSeverity { low, medium, high }

enum DetectionMethod { imageProcessing, deepLearning }
