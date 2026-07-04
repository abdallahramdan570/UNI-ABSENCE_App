
import 'package:flutter/material.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/exam_report_info_card.dart';

class CardDetailsSection extends StatelessWidget {
  const CardDetailsSection({
    super.key, required this.courseName, required this.examDate, required this.examTime,
  });
  final String courseName ;
    final DateTime examDate ;
  final String examTime ;

  @override
  Widget build(BuildContext context) {
    return ExamReportInfoCard(
      courseName: courseName,
      examDate: examDate,
      examTime: examTime,
    );
  }
}
