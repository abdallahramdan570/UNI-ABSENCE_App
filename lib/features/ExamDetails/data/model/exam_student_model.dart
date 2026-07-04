import 'package:uni_absence/features/ExamDetails/domain/entities/exam_record_entity.dart';

class ExamStudentModel extends ExamRecordEntity {
  const ExamStudentModel({
    required super.code,
    required super.name,
    required super.department,
    super.entryTime,
    super.exitTime,
    required super.attended,
  });

  factory ExamStudentModel.fromJson(Map<String, dynamic> json) {
    return ExamStudentModel(
      code: 'N/A', // Code is not provided by the API
      name: json['name'] ?? 'Unknown',
      department: json['department'] ?? 'Unknown',
      entryTime: json['entryTime'],
      exitTime: json['exitTime'],
      attended: json['entryTime'] != null,
    );
  }
}