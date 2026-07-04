import 'package:equatable/equatable.dart';

class ExamEntity extends Equatable {
  final int id;
  final int sectorId;
  final String examName;
  final String examDate;
  final String examStart;
  final String examEnd;

  // Mocked fields for UI compatibility
  final int totalStudents;
  final int currentStudents;
  final String status;

  const ExamEntity({
    required this.id,
    required this.sectorId,
    required this.examName,
    required this.examDate,
    required this.examStart,
    required this.examEnd,
    required this.totalStudents,
    required this.currentStudents,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        sectorId,
        examName,
        examDate,
        examStart,
        examEnd,
        totalStudents,
        currentStudents,
        status,
      ];
}
