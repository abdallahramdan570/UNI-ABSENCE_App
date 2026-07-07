import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class ExamEntity extends Equatable {
  /// رقم الامتحان
  final int id;

  /// رقم القطاع
  final int sectorId;

  /// اسم الامتحان
  final String name;

  /// بداية الامتحان
  final String examStart;

  /// نهاية الامتحان
  final String examEnd;

  /// عدد الطلاب المسجلين في الامتحان
  final int studentsCount;

  const ExamEntity({
    required this.id,
    required this.sectorId,
    required this.name,
    required this.examStart,
    required this.examEnd,
    required this.studentsCount,
  });

  /// وقت البداية بصيغة 10:00 AM
  String get startTime =>
      DateFormat('hh:mm a').format(DateTime.parse(examStart));

  /// وقت النهاية بصيغة 01:00 PM
  String get endTime =>
      DateFormat('hh:mm a').format(DateTime.parse(examEnd));

  /// الوقت بالكامل
  String get examTime => "$startTime - $endTime";

  /// حالة الامتحان
  String get examStatus {
    final now = DateTime.now();

    final start = DateTime.parse(examStart);

    final end = DateTime.parse(examEnd);

    if (now.isBefore(start)) {
      return "Upcoming";
    }

    if (now.isAfter(end)) {
      return "Completed";
    }

    return "Current";
  }

  @override
  List<Object?> get props => [
        id,
        sectorId,
        name,
        examStart,
        examEnd,
        studentsCount,
      ];
}