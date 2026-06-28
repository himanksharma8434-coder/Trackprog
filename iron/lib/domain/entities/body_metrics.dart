enum MeasurementType { neck, shoulders, chest, waist, hips, leftArm, rightArm, leftThigh, rightThigh, leftCalf, rightCalf }

class BodyWeightEntry {
  final String id;
  final double weightKg;
  final DateTime date;

  BodyWeightEntry({
    required this.id,
    required this.weightKg,
    required this.date,
  });
}

class BodyMeasurement {
  final String id;
  final MeasurementType type;
  final double valueCm;
  final DateTime date;

  BodyMeasurement({
    required this.id,
    required this.type,
    required this.valueCm,
    required this.date,
  });
}

class ProgressPhoto {
  final String id;
  final String localPath;
  final String? remoteUrl;
  final String? angle;
  final DateTime date;
  final String? note;

  ProgressPhoto({
    required this.id,
    required this.localPath,
    this.remoteUrl,
    this.angle,
    required this.date,
    this.note,
  });
}
