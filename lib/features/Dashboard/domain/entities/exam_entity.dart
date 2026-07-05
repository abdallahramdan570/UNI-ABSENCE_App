import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class ExamEntity extends Equatable {
  // رقم الامتحان
  final int id;

  // رقم القطاع
  final int sectorId;

  // اسم المادة
  final String examName;

  // تاريخ الامتحان
  final String examDate;

  // وقت البداية (القيمة الأصلية القادمة من الـ API)
  final String examStart;

  // وقت النهاية (القيمة الأصلية القادمة من الـ API)
  final String examEnd;

  // عدد الطلبة
  final int studentsCount;

final int totalStudents;
final int status;
  final int currentStudents;
  const ExamEntity({
    required this.id,
    required this.sectorId,
    required this.examName,
    required this.examDate,
    required this.examStart,
    required this.examEnd,
    required this.studentsCount,
    required this.totalStudents,
    required this.currentStudents,
    required this.status,
  });

  //===========================================
  // تنسيق الوقت للعرض فقط
  //===========================================
// ============================
  // تحويل وقت البداية لصيغة 10:00 AM
  // ============================
  String get examStartTime {
    return DateFormat('hh:mm a').format(
      DateTime.parse(examStart),
    );
  }

  // ============================
  // تحويل وقت النهاية لصيغة 01:00 PM
  // ============================
  String get examEndTime {
    return DateFormat('hh:mm a').format(
      DateTime.parse(examEnd),
    );
  }

  // ============================
  // الوقت الكامل
  // 10:00 AM - 01:00 PM
  // ============================
  String get examTime {
    return "$examStartTime - $examEndTime";
  }

  //===========================================
  // تحديد حالة الامتحان
  //===========================================
String get examStatus {
  final now = DateTime.now();

  final start = DateTime.parse(examStart);
  final end = DateTime.parse(examEnd);

  // قبل بداية الامتحان
  if (now.isBefore(start)) {
    return "Upcoming";
  }

  // أثناء الامتحان
  if ((now.isAtSameMomentAs(start) || now.isAfter(start)) &&
      now.isBefore(end)) {
    return "Current";
  }

  // بعد نهاية الامتحان
  return "Completed";
}
  @override
  List<Object?> get props => [
        id,
        sectorId,
        examName,
        examDate,
        examStart,
        examEnd,
        studentsCount,
      ];
}