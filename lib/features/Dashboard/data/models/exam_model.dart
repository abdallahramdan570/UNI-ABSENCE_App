import 'package:uni_absence/features/Dashboard/domain/entities/exam_entity.dart';
import 'package:intl/intl.dart';

class ExamModel extends ExamEntity {
  const ExamModel({
    required super.id,
    required super.sectorId,
    required super.examName,
    required super.examDate,
    required super.examStart,
    required super.examEnd,
    required super.totalStudents,
    required super.currentStudents,
    required super.status,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    // Parse time to format suitable for UI, e.g., "11:00 AM"
    String formatTime(String isoTime) {
      try {
        final DateTime parsedTime = DateTime.parse(isoTime);
        return DateFormat('hh:mm a').format(parsedTime);
      } catch (e) {
        return isoTime;
      }
    }

    final String startTime = formatTime(json['examStart'] ?? '');
    final String endTime = formatTime(json['examEnd'] ?? '');

    // Mocking missing data for UI
    return ExamModel(
      id: json['id'] ?? 0,
      sectorId: json['sectorId'] ?? 0,
      examName: json['name'] ?? 'Unknown Exam',
      examDate: json['examDate'] ?? '',
      examStart: startTime,
      examEnd: endTime,
      totalStudents: 50, // Mocked
      currentStudents: 25, // Mocked
      status: 'Pending', // Mocked
    );
  }

  // To support legacy code in sector_tabs that still expects ExamModel getters
  String get examTime => '$examStart - $examEnd';
}
