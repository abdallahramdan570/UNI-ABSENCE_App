import 'package:uni_absence/features/History/domain/entity/exam_record_entity.dart';

class ExamRecordModel extends ExamRecordEntity {
  const ExamRecordModel({
    required super.name,
    required super.department,
    required super.entryTime,
    required super.exitTime,
  });

  static String? _asNullableString(dynamic value) {
    if (value == null) return null;
    final text = value.toString().trim();
    return text.isEmpty ? null : text;
  }

  factory ExamRecordModel.fromJson(Map<String, dynamic> json) {
    return ExamRecordModel(
      name: json['name']?.toString() ?? '',
      department: json['department']?.toString() ?? '',
      entryTime: _asNullableString(json['entryTime']),
      exitTime: _asNullableString(json['exitTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'department': department,
      'entryTime': entryTime,
      'exitTime': exitTime,
    };
  }
}
