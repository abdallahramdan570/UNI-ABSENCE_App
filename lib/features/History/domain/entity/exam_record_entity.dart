import 'package:equatable/equatable.dart';

class ExamRecordEntity extends Equatable {
  /// اسم الطالب
  final String name;

  /// القسم
  final String department;

  /// وقت الدخول
  final String? entryTime;

  /// وقت الخروج
  final String? exitTime;

  const ExamRecordEntity({
    required this.name,
    required this.department,
    required this.entryTime,
    required this.exitTime,
  });

  /// الطالب حاضر إذا كان لديه وقت دخول
  bool get isPresent => entryTime != null;

  /// الطالب غائب إذا لم يكن لديه وقت دخول
  bool get isAbsent => entryTime == null;

  @override
  List<Object?> get props => [
        name,
        department,
        entryTime,
        exitTime,
      ];
}