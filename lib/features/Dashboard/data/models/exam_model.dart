import 'package:uni_absence/features/Dashboard/domain/entities/exam_entity.dart';

class ExamModel extends ExamEntity {
  const ExamModel({
    required super.id,
    required super.sectorId,
    required super.examName,
    required super.examDate,
    required super.examStart,
    required super.examEnd,
    required super.studentsCount,
    required super.totalStudents,
    required super.currentStudents,
    required super.status,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['id'] ?? 0,
      sectorId: json['sectorId'] ?? 0,
      examName: json['name'] ?? 'Unknown Exam',
      examDate: json['examDate'] ?? '',
      examStart: json['examStart'] ?? '',
      examEnd: json['examEnd'] ?? '',
      studentsCount: json['studentsCount'] ?? json['currentStudents'] ?? 0,
      totalStudents: json['totalStudents'] ?? 0,
      currentStudents: json['currentStudents'] ?? 0,
      status: int.tryParse('${json['status'] ?? 0}') ?? 0,
    );
  }
}
