import 'package:uni_absence/features/History/domain/entity/exam_entity.dart';

class ExamModel extends ExamEntity {
  const ExamModel({
    required super.id,
    required super.sectorId,
    required super.name,
    required super.examStart,
    required super.examEnd,
    required super.studentsCount,
  });

  static int _asInt(dynamic value, {int fallback = 0}) {
    if (value is int) return value;
    return int.tryParse(value?.toString() ?? '') ?? fallback;
  }

  /// تحويل الـ JSON الخام القادم من الـ API الأول إلى Model
  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: _asInt(json['id']),
      sectorId: _asInt(json['sectorId']),
      name: json['name']?.toString() ?? '',
      examStart: json['examStart']?.toString() ?? '',
      examEnd: json['examEnd']?.toString() ?? '',
      studentsCount: _asInt(json['studentsCount']),
    );
  }

  /// تحويل الـ Model إلى JSON (إذا احتجت لعمل Caching لاحقاً)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sectorId': sectorId,
      'name': name,
      'examStart': examStart,
      'examEnd': examEnd,
      'studentsCount': studentsCount,
    };
  }
}
