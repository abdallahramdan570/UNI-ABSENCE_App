import 'package:equatable/equatable.dart';

class ExamRecordEntity extends Equatable {
  final String code; // Mocked
  final String name;
  final String department;
  final String? entryTime;
  final String? exitTime;
  final bool attended; // Derived

  const ExamRecordEntity({
    required this.code,
    required this.name,
    required this.department,
    this.entryTime,
    this.exitTime,
    required this.attended,
  });

  @override
  List<Object?> get props => [
        code,
        name,
        department,
        entryTime,
        exitTime,
        attended,
      ];
}
